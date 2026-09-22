live;
event_inherited();

depth = DEPTH_BATTLE.BULLETS_ENEMY

radius         = 300;                              // 外半径(像素)
ring_width     = 50;                               // 圆环宽度(像素); 内半径 = radius - ring_width
segments       = 180;                              // 圆周细分段数(越大越平滑)
ring_colour    = c_white;     // 圆环颜色(会乘到纹理上)
ring_alpha     = 0.5;                              // 圆环透明度(会乘到纹理 alpha 上)
radius_spd = 0;

// ==================== 环形纹理(画师给的长条) ====================
// 实测这条精灵是 1px 宽 × 38px 高(不是 100):
//   · 完全不透明的只有中间约 8 行(第 15~22 行), 其余是 alpha 从 2 渐显到 255 的对称光晕;
//   · 颜色从边缘 (0,162,133) 青绿 渐变到中间 (0,155,255) 蓝。
// ring_tex_band = 让"判定带"对应精灵里的多少像素: 取 8 = 实心部分就是判定带;
//                 取 14 则判定带比实心部分略宽(玩家会在还没碰到实心时就被判定)。
// 绘制时把 [内半径, 外半径] 对齐到这段, 其余部分等比外扩成光晕; 判定/重叠/伤害只按 [内半径, 外半径]。
// 不想要纹理就把它设成 -1(退回纯顶点色画法)。
ring_sprite   = spr_bullet_enemy_wavering;
ring_tex_band = 14;                                // 判定带对应的精灵像素高度(实心部分约 8)
ring_debug    = 0;                             // 临时诊断开关: 左上角直接画出这条长条 + 打印 UV(见 Draw_0)
// 重叠区域的颜色/透明度/伤害由 bullet_enemy_wavering_manager 统一管理(见该对象的 Create)

cull_outside_room = true;   // 圆环完全移出房间就销毁自己

// 重叠绘制 + 重叠伤害都由 bullet_enemy_wavering_manager 统一处理,
// 房间忘了放 manager 时这里自动补一个(深度取"圆环之后、UI 之前")。
if (!instance_exists(bullet_enemy_wavering_manager)) {
    instance_create_depth(0, 0, DEPTH_BATTLE.BULLETS_ENEMY - 1, bullet_enemy_wavering_manager);
}

/// @desc 圆环的内半径(宽度 ≥ 半径时退化成实心圆, 即 0)
///       出界剔除和 ring_draw_shape 共用它, 保证"判断的形状"和"画出来的形状"永远一致
/// @param {Id.Instance} _inst   目标实例
/// @returns {Real} 内半径
ring_inner_radius = function(_inst) {
    return clamp(_inst.radius - _inst.ring_width, 0, _inst.radius);
};

/// @desc 长条纹理里"判定带之外的光晕"换算成径向额外宽度(内、外各一份)
///       精灵高 h、判定带高 band → 上下各 (h-band)/2 px, 按比例换算: ring_width * ((h-band)/2) / band
/// @param {Id.Instance} _inst   目标实例
/// @param {Asset.GMSprite} _tex 纹理精灵(-1 = 无纹理 → 0)
/// @returns {Real} 光晕在径向多出来的宽度
ring_tex_pad = function(_inst, _tex) {
    if (is_undefined(_tex) || _tex == -1) return 0;
    var _band = _inst.ring_tex_band;
    if (is_undefined(_band) || _band <= 0) _band = sprite_get_height(_tex);
    return _inst.ring_width * ((sprite_get_height(_tex) - _band) / 2) / _band;
};

/// @desc 绘制指定实例的圆环几何体(三角带: 外圈/内圈顶点交替, 形成圆环带)
/// @param {Id.Instance} _inst   要绘制的实例
/// @param {Real} _col           颜色(会乘到纹理上做 tint)
/// @param {Real} _alpha         透明度(会乘到纹理 alpha 上)
/// @param {Asset.GMSprite} _tex 环形纹理(-1 = 不用纹理, 纯顶点色)
///        ⚠ 重叠遮罩必须传 -1: 遮罩要求 alpha 只能是 0/1, 带上光晕纹理就不是二值的了
ring_draw_shape = function(_inst, _col, _alpha, _tex = -1) {
    if (is_undefined(_tex)) _tex = -1;             // 兜底: GMLive 热重载时参数可能是 undefined
    var _outer = _inst.radius;
    var _inner = ring_inner_radius(_inst);
    var _seg   = max(8, floor(_inst.segments));

    if (_outer > 0) {
        var _px = _inst.x;
        var _py = _inst.y;

        // 判定带对齐到精灵中间那 20px, 光晕按同比例往外扩:
        //   可视范围 = [inner - pad, outer + pad]
        // 判定范围仍然只有 [inner, outer](重叠、伤害都用它), 光晕纯粹是画出来的。
        var _pad   = ring_tex_pad(_inst, _tex);
        var _out_v = _outer + _pad;
        var _in_v  = max(0, _inner - _pad);

        // 必须用三角带(pr_trianglestrip): 外圈/内圈顶点交替, 相邻两个角度之间正好铺成一圈四边形.
        // 不能用 pr_trianglefan —— 扇形的每个三角形都从第 0 个顶点出发, 绕到圆环另一侧时
        // 会拉出横穿中孔的巨大三角形, 结果就是"齿轮 / 放射状"伪影.
        if (_tex == -1) {
            draw_primitive_begin(pr_trianglestrip);
        }
        else {
            draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(_tex, 0));
        }

        // UV: 精灵是 1px 宽的竖条 → 横向取这一列的正中(天然无缝, 不需要重复计数);
        //     纵向 top = 内(含光晕), bottom = 外(含光晕)。
        // 如果发现内外画反了, 把下面的 _uv[1] / _uv[3] 对调即可。
        var _uv   = (_tex == -1) ? undefined : sprite_get_uvs(_tex, 0);
        var _u_t  = (_tex == -1) ? 0 : (_uv[0] + _uv[2]) * 0.5;
        var _v_in = (_tex == -1) ? 0 : _uv[1];
        var _v_ou = (_tex == -1) ? 0 : _uv[3];

        for (var i = 0; i <= _seg; i++) {
            var _ang = (i / _seg) * 2 * pi;
            var _co  = cos(_ang);
            var _si  = sin(_ang);
            if (_tex == -1) {
                draw_vertex_colour(_px + _co * _out_v, _py + _si * _out_v, _col, _alpha);
                draw_vertex_colour(_px + _co * _in_v,  _py + _si * _in_v,  _col, _alpha);
            }
            else {
                draw_vertex_texture_colour(_px + _co * _out_v, _py + _si * _out_v, _u_t, _v_ou, _col, _alpha);
                draw_vertex_texture_colour(_px + _co * _in_v,  _py + _si * _in_v,  _u_t, _v_in, _col, _alpha);
            }
        }
        draw_primitive_end();
    }
};
