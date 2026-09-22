live;
/// Draw: 统一处理所有 wavering 圆环的"重叠绘制"与"重叠伤害"
///
/// 深度: 本对象默认放在 DEPTH_BATTLE.BULLETS_ENEMY - 1 (见 Create),
///       也就是"刚好在所有圆环之后、ITEM_EFFECTS / UI 之前"——
///       于是红色重叠区能盖住圆环本身, 又不会糊住道具特效和 HUD。
///       (放在 Draw End 也能画, 但那样会盖住 UI, 所以不这么做。)
///
/// 为什么用 Draw 而不是 Step:
///   圆环半径是在 bullet_enemy_wavering 的 Draw 事件里推进的(radius += radius_spd),
///   而圆环深度(-400)比本对象(-401)靠后、会先画完,
///   所以轮到本对象时半径已经推进完毕 → "画出来的红色区域"和"会受伤的区域"完全一致。
///
/// 重叠判定: 逐个圆环求"它 ∩ 之前所有圆环的并集", 再并起来(二值遮罩相乘);
///           应用表面上先把重叠处擦成透明、再写入纯色 → 重叠处就是纯色本身, 与圆环颜色无关。
///
/// ⚠ 遮罩的取法(看 overlap_use_glow):
///   · true (默认): 遮罩传纹理 → alpha 带光晕的软边, 重叠区 = "指定色调 × 光晕相交形状";
///   · false: 遮罩传 -1 → 只取判定带, alpha 是干净二值, 重叠区 = 硬边纯色色块。
///   两种情况下判定/伤害都只按 [内半径, 外半径] 算 —— 光晕不参与伤害。
/// 性能: 每个圆环只花 1 次清屏 + 2 次全屏搬运(线性复杂度), 十几个实例也不会拖慢帧率。

if (id != instance_find(object_index, 0)) exit;      // 有多个 manager 时只留一个干活

var _rings = wavering_collect();
if (array_length(_rings) < 2) exit;                  // 不足两个圆环 → 不存在重叠

if (!ring_ensure_surfaces()) exit;
var _union   = global.ring_union_surface;            // 已处理圆环的并集(二值)
var _overlap = global.ring_overlap_surface;          // 重叠区域(二值)
var _scratch = global.ring_scratch_surface;          // 临时: 当前圆环 ∩ 之前的并集
if (!surface_exists(_union) || !surface_exists(_overlap) || !surface_exists(_scratch)) exit;

// 保存当前的绘制/混合状态, 结束时原样还原, 不干扰同房间里其他对象
var _old_filter      = gpu_get_tex_filter();
var _old_blendenable = gpu_get_blendenable();
var _old_blend_src   = gpu_get_blendmode_src();
var _old_blend_dest  = gpu_get_blendmode_dest();
var _old_blend_srca  = gpu_get_blendmode_srcalpha();
var _old_blend_desta = gpu_get_blendmode_destalpha();
var _old_draw_alpha  = draw_get_alpha();
var _old_draw_colour = draw_get_colour();

gpu_set_tex_filter(false);        // 遮罩是 1:1 搬运, 关闭过滤才能保证逐像素精确

// 绘制状态归位: 二值遮罩要求绘制时 draw alpha = 1, 颜色 = 白,
// 否则遮罩的 alpha 就不是干净的 1, 交集也就不再是二值的了。
gpu_set_blendmode(bm_normal);
gpu_set_blendenable(true);
draw_set_alpha(1.0);
draw_set_colour(c_white);

// ---- 1) 清空"并集"与"重叠"两张遮罩 ----
surface_set_target(_union);
draw_clear_alpha(c_black, 0);
surface_reset_target();

surface_set_target(_overlap);
draw_clear_alpha(c_black, 0);
surface_reset_target();

// ---- 2) 第 1 个圆环先进并集 ----
//  overlap_use_glow = true 时遮罩取"圆环的可视 alpha"(含纹理光晕) → 重叠区带光晕软边;
//  false 时只取判定带(硬边, 老行为)。几何体由圆环自己提供: 直接调它自己的 ring_draw_shape。
var _mtex = overlap_use_glow ? _rings[0].ring_sprite : -1;
surface_set_target(_union);
gpu_set_blendmode(bm_normal);          // 软 alpha(带光晕)的"并集"要用普通混合
_rings[0].ring_draw_shape(_rings[0], c_white, 1.0, _mtex);
surface_reset_target();

// ---- 3) 其余圆环: 先与"之前的并集"求交并入 overlap, 再把自身并进 union ----
for (var i = 1; i < array_length(_rings); i++) {
    var _ri     = _rings[i];
    var _mtex_i = overlap_use_glow ? _ri.ring_sprite : -1;

    // scratch = 圆环 i ∩ 之前的并集
    surface_set_target(_scratch);
    draw_clear_alpha(c_black, 0);
    gpu_set_blendenable(false);                       // 先不混合, 把圆环 i 自己写进 scratch
    _ri.ring_draw_shape(_ri, c_white, 1.0, _mtex_i);
    gpu_set_blendenable(true);
    gpu_set_blendmode_ext(bm_zero, bm_src_alpha);
    draw_surface(_union, 0, 0);                        // dst = dst × src.alpha → 只留交集
    surface_reset_target();

    // overlap |= scratch
    surface_set_target(_overlap);
    gpu_set_blendmode(bm_normal);
    draw_surface(_scratch, 0, 0);
    surface_reset_target();

    // union |= 圆环 i
    surface_set_target(_union);
    gpu_set_blendmode(bm_normal);
    _ri.ring_draw_shape(_ri, c_white, 1.0, _mtex_i);
    surface_reset_target();
}

// ---- 3.5) 把重叠遮罩的 RGB 刷成白色, 只留下 alpha 形状 ----
//  下一步要用 overlap_colour 乘出"指定色调", 所以遮罩 RGB 必须是 1 —— 否则纹理自身的颜色
//  (这条是 R=0 的青蓝)会把指定色调的通道乘没(红色会被乘成黑)。
//  用 sepalpha(bm_one, bm_zero, bm_zero, bm_one): 只写 RGB, alpha 原样保留。
surface_set_target(_overlap);
gpu_set_blendmode_ext_sepalpha(bm_one, bm_zero, bm_zero, bm_one);
draw_rectangle_colour(0, 0, surface_get_width(_overlap), surface_get_height(_overlap),
                      c_white, c_white, c_white, c_white, false);
surface_reset_target();

// ---- 4) 把重叠区域擦掉(圆环颜色在这里被移除; 软边处按 alpha 比例减淡) ----
gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
draw_surface(_overlap, 0, 0);

// ---- 5) 用指定色调乘上遮罩的 alpha 形状(光晕形状 + 指定色调, 不混进圆环自己的颜色) ----
//      用 sepalpha 的"标准 alpha 混合": 颜色通道不变, alpha 为 a_src + a_dst*(1-a_src),
//      这样 overlap_alpha 才能原样写进去(不会被再乘一次)。
gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
draw_surface_ext(_overlap, 0, 0, 1, 1, 0, overlap_colour, overlap_alpha);

// 还原绘制/混合状态
gpu_set_blendmode_ext_sepalpha(_old_blend_src, _old_blend_dest, _old_blend_srca, _old_blend_desta);
gpu_set_blendenable(_old_blendenable);
gpu_set_tex_filter(_old_filter);
draw_set_alpha(_old_draw_alpha);
draw_set_colour(_old_draw_colour);

// ---- 6) 玩家碰到重叠区域 → 受伤 ----
//      守卫条件和 bullet_enemy 的碰撞完全一致: 无敌帧 / 护盾 / 弹幕消除时间内不受伤害,
//      所以站在重叠区里也只会按 global.inv_hurt 的节奏掉血, 不会每帧连扣。
if (overlap_hurt_player
&&  Player_IsEnabled()
&&  global.inv_hurt = 0
&&  global.inv_shield = 0
&&  !Player_IsBreaktime()) {
    if (wavering_player_on_overlap(_rings)) {
        Player_Hurt(overlap_damage);     // 扣血(含护甲能力结算, 与中弹一致)
        Player_CallHurtEvent();          // 玩家受伤表现: 相机抖动 / 无敌帧 / 武器降级等
    }
}
