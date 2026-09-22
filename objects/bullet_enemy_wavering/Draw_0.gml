live;
radius += radius_spd
/// Draw: 每个实例照常绘制自己的淡蓝色半透明圆环
///       并且做出界剔除: 圆环的可见部分完全不在房间内 → 销毁自己。
/// 此时重叠区域还只是普通的半透明叠加(会偏蓝),
/// 稍后由 Draw End 事件把它们精确替换成纯色。

// 兜底: GMLive 热重载时 Create 可能没重跑, 这两个变量会是 undefined
if (is_undefined(ring_sprite))   ring_sprite   = spr_bullet_enemy_wavering;
if (is_undefined(ring_tex_band)) ring_tex_band = 8;

// ==================== 临时诊断(把 Create 里的 ring_debug 设成 true) ====================
// 屏幕左上角会把这条长条拉宽画出来, 并把 UV/参数打进调试输出。用途:
//   · 看得到这条带渐变的长条 → 新代码确实在跑;  看不到 → 工程没重新编译 / 热重载没生效
//   · 长条本身是纯色        → 精灵内容问题;  长条有渐变而圆环是纯色 → 采样或混合把它压平了
if (ring_debug && !is_undefined(ring_sprite) && ring_sprite != -1) {
    var _dbg_uv = sprite_get_uvs(ring_sprite, 0);
    gpu_set_blendmode(bm_normal);
    gpu_set_blendenable(true);
    draw_sprite_ext(ring_sprite, 0, 40, 40, 240, 6, 0, c_white, 1);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    draw_text(40, 300, "spr=" + string(ring_sprite) + "  h=" + string(sprite_get_height(ring_sprite))
                    + "  band=" + string(ring_tex_band) + "  pad=" + string(ring_tex_pad(id, ring_sprite)));
    draw_text(40, 320, "uv=" + string(_dbg_uv[0]) + ", " + string(_dbg_uv[1]) + ", " + string(_dbg_uv[2]) + ", " + string(_dbg_uv[3]));
    draw_text(40, 340, "radius=" + string(radius) + "  ring_width=" + string(ring_width) + "  alpha=" + string(ring_alpha));
    // 对照实验: 用"图元 + 同一组 UV"再画一条, 和上面 draw_sprite_ext 那条并排比较。
    //   · 图元这条也有渐变 → 图元采样没问题, 问题在圆环几何那边
    //   · 图元这条是纯色   → 这套运行时/纹理页设置下 sprite_get_uvs + draw_vertex_texture 采样不对
    var _dbg_tex = sprite_get_texture(ring_sprite, 0);
    draw_primitive_begin_texture(pr_trianglestrip, _dbg_tex);
    draw_vertex_texture_colour(340,      40, _dbg_uv[0], _dbg_uv[1], c_white, 1);
    draw_vertex_texture_colour(340 + 38, 40, _dbg_uv[2], _dbg_uv[1], c_white, 1);
    draw_vertex_texture_colour(340,      280, _dbg_uv[0], _dbg_uv[3], c_white, 1);
    draw_vertex_texture_colour(340 + 38, 280, _dbg_uv[2], _dbg_uv[3], c_white, 1);
    draw_primitive_end();

    var _dbg_tw = 1 / texture_get_texel_width(_dbg_tex);
    var _dbg_th = 1 / texture_get_texel_height(_dbg_tex);
    draw_text(40, 360, "page=" + string(_dbg_tw) + " x " + string(_dbg_th)
                    + "  texel=" + string(texture_get_texel_width(_dbg_tex)) + " x " + string(texture_get_texel_height(_dbg_tex))
                    + "  repeat=" + string(gpu_get_texrepeat()) + "  filter=" + string(gpu_get_tex_filter()));
    draw_text(40, 380, "左侧=精灵画法  右侧=图元采样(同一组UV)");

    show_debug_message("wavering ring: spr=" + string(ring_sprite) + " h=" + string(sprite_get_height(ring_sprite))
                     + " band=" + string(ring_tex_band) + " pad=" + string(ring_tex_pad(id, ring_sprite))
                     + " uv=" + string(_dbg_uv[0]) + "," + string(_dbg_uv[1]) + "," + string(_dbg_uv[2]) + "," + string(_dbg_uv[3])
                     + " page=" + string(_dbg_tw) + "x" + string(_dbg_th)
                     + " texel=" + string(texture_get_texel_width(_dbg_tex)) + "x" + string(texture_get_texel_height(_dbg_tex))
                     + " repeat=" + string(gpu_get_texrepeat()) + " filter=" + string(gpu_get_tex_filter()));
}

// ==================== 出界剔除 ====================
// 圆环是一条"内半径 ~ 外半径"的环带(中间是空的), 所以不能只看包围盒:
// 房间矩形里只要还有一点到圆心的距离落在 [内半径, 外半径] 之间, 就还有可见部分。
//   _near = 圆心到房间矩形的最近距离(圆心在矩形内时就是 0)
//   _far  = 圆心到房间最远角的距离(矩形上离定点最远的点一定在角上)
// 圆心到矩形上各点的距离正好覆盖 [_near, _far] 这个区间, 于是
//   环带与房间有交集  ⇔  _near <= 外半径 且 _far >= 内半径
if (cull_outside_room) {
    var _pad   = ring_tex_pad(id, ring_sprite);   // 长条纹理上下还有光晕, 出界判断也要把它算进去
    var _outer = radius + _pad;
    var _inner = max(0, ring_inner_radius(id) - _pad);
    var _near  = point_distance(x, y, clamp(x, 0, room_width), clamp(y, 0, room_height));
    var _far   = max(point_distance(x, y, 0, 0),
                     point_distance(x, y, room_width, 0),
                     point_distance(x, y, 0, room_height),
                     point_distance(x, y, room_width, room_height));

    if (_near > _outer || _far < _inner) {
        instance_destroy(id);
        exit;                     // 实例已经销毁, 本事件剩下的代码不用再执行
    }

    // 如果以后想改成"移出摄像机视野就销毁", 把上面的 room_width/room_height 换成视图矩形:
    //   var _cam = view_camera[0];
    //   var _l = camera_get_view_x(_cam);
    //   var _t = camera_get_view_y(_cam);
    //   var _r = _l + camera_get_view_width(_cam);
    //   var _b = _t + camera_get_view_height(_cam);
    //   _near = point_distance(x, y, clamp(x, _l, _r), clamp(y, _t, _b));
    //   _far  = max(point_distance(x, y, _l, _t), point_distance(x, y, _r, _t),
    //               point_distance(x, y, _l, _b), point_distance(x, y, _r, _b));
}

// 顶点颜色/透明度都是显式给出的, 这里把绘制状态归位,
// 避免受房间里其他对象遗留的 draw_set_* / 混合模式影响。
gpu_set_blendmode(bm_normal);
gpu_set_blendenable(true);
draw_set_alpha(1.0);
draw_set_colour(c_white);

gpu_set_blendmode(bm_add);
ring_draw_shape(id, ring_colour, ring_alpha, ring_sprite);
gpu_set_blendmode(bm_normal);