live;
/// bullet_enemy_wavering_manager —— 统一管理所有 bullet_enemy_wavering 圆环的:
///   1) 重叠区域的绘制(用 overlap_colour 这个"色调"乘在圆环光晕的 alpha 形状上, 不与圆环颜色混色)
///   2) 玩家碰到重叠区域的伤害判定
///
/// 房间里放一个即可; 如果忘了放, bullet_enemy_wavering 创建时会自动补一个。

// ============================= 可调参数 =============================
overlap_colour      = make_colour_rgb(255, 74, 74);   // 重叠部分的色调(乘在光晕 alpha 上)
overlap_alpha       = 1.0;                            // 重叠部分透明度(1 = 最实)
overlap_hurt_player = true;                           // 玩家碰到重叠区域是否受伤
overlap_damage      = 1;                              // 每次伤害值(受玩家无敌帧限制, 不会连续扣)
overlap_use_glow    = true;                           // 重叠区跟随圆环纹理光晕(软边); false = 只按判定带(硬边)

// 深度: 刚好在所有圆环(DEPTH_BATTLE.BULLETS_ENEMY)之后、ITEM_EFFECTS / UI 之前。
// 这样红色重叠区能盖住圆环本身, 又不会盖住道具特效和 HUD。
depth = DEPTH_BATTLE.BULLETS_ENEMY - 1;

// ==================== 共享表面(全局, 只初始化一次) ====================
// 三张和屏幕一样大的表面:
//   union   —— 已经处理过的圆环的并集(二值: alpha=1 表示被覆盖)
//   overlap —— 重叠区域(二值: alpha=1 表示被 >=2 个圆环覆盖)
//   scratch —— 临时遮罩: "当前圆环 ∩ 之前的并集"
if (!variable_global_exists("ring_union_surface")) {
    global.ring_union_surface   = -1;
    global.ring_overlap_surface = -1;
    global.ring_scratch_surface = -1;
}

/// @desc 确保某张共享表面存在且尺寸正确(表面可能被系统回收), 返回可用的表面 id
ring_ensure_surface = function(_surf, _w, _h) {
    if (!surface_exists(_surf)
    ||  surface_get_width(_surf)  != _w
    ||  surface_get_height(_surf) != _h) {
        if (surface_exists(_surf)) surface_free(_surf);
        _surf = surface_create(_w, _h);
    }
    return _surf;
};

/// @desc 确保三张共享遮罩表面存在, 且尺寸覆盖整个绘制区域
/// @returns {Bool} 表面是否可用
ring_ensure_surfaces = function() {
    var _w = room_width;
    var _h = room_height;
    if (surface_exists(application_surface)) {           // 窗口比房间大时也要盖得住
        _w = max(_w, surface_get_width(application_surface));
        _h = max(_h, surface_get_height(application_surface));
    }

    global.ring_union_surface   = ring_ensure_surface(global.ring_union_surface,   _w, _h);
    global.ring_overlap_surface = ring_ensure_surface(global.ring_overlap_surface, _w, _h);
    global.ring_scratch_surface = ring_ensure_surface(global.ring_scratch_surface, _w, _h);

    return (surface_exists(global.ring_union_surface)
         && surface_exists(global.ring_overlap_surface)
         && surface_exists(global.ring_scratch_surface));
};

/// @desc 收集房间里所有 wavering 圆环实例
/// @returns {Array} 实例 id 数组(每帧位置/半径都可能变, 所以每帧重新收集)
wavering_collect = function() {
    var _n = instance_number(bullet_enemy_wavering);
    var _a = array_create(_n);
    for (var i = 0; i < _n; i++) {
        _a[i] = instance_find(bullet_enemy_wavering, i);
    }
    return _a;
};

/// @desc 点 (_px,_py) 是否落在"被 >=2 个圆环覆盖"的重叠区域里
///       内半径算法与 bullet_enemy_wavering.ring_draw_shape 保持一致,
///       这样"判定用的形状"和"画出来的形状"是同一个圆环带
/// @param {Array} _rings  圆环实例数组
/// @param {Real} _px
/// @param {Real} _py
/// @returns {Bool}
wavering_overlap_at = function(_rings, _px, _py) {
    var _hit = 0;
    for (var i = 0; i < array_length(_rings); i++) {
        var _b = _rings[i];
        if (instance_exists(_b)) {
            var _d     = point_distance(_b.x, _b.y, _px, _py);
            var _inner = clamp(_b.radius - _b.ring_width, 0, _b.radius);
            if (_d >= _inner && _d <= _b.radius) {
                _hit += 1;
                if (_hit >= 2) return true;      // 同时落在两个圆环里 → 属于重叠区域
            }
        }
    }
    return false;
};

/// @desc 玩家判定框是否碰到重叠区域
///       在玩家的判定圆内取样(玩家命中框 16x16 的椭圆 → 半径约 8px),
///       任一样本点落在重叠区域即算碰到
/// @param {Array} _rings  圆环实例数组
/// @returns {Bool}
wavering_player_on_overlap = function(_rings) {
    var _l  = player.bbox_left;
    var _r  = player.bbox_right;
    var _t  = player.bbox_top;
    var _b  = player.bbox_bottom;
    var _cx = (_l + _r) * 0.5;
    var _cy = (_t + _b) * 0.5;
    var _pr = max(1, min(_r - _l, _b - _t) * 0.5);        // 判定半径
    var _st = max(0.5, _pr / 4);                          // 半径上分 4 档 → 9x9 个取样点

    for (var _sy = _cy - _pr; _sy <= _cy + _pr + 0.001; _sy += _st) {
        for (var _sx = _cx - _pr; _sx <= _cx + _pr + 0.001; _sx += _st) {
            if (point_distance(_sx, _sy, _cx, _cy) <= _pr) {     // 只取判定圆内的点
                if (wavering_overlap_at(_rings, _sx, _sy)) return true;
            }
        }
    }
    return false;
};
