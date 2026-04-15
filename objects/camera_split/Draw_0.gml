/// 1. 方向向量（一次计算）
var rad = degtorad(image_angle);
var s = sin(rad);
var c = cos(rad);

var xx = s * 1000;
var yy = c * 1000;

/// 2. 确保 surface 存在（不要每帧创建/销毁）
if (!surface_exists(bm)) {
    bm = surface_create(room_width, room_height);
}

/// 3. 只在需要时更新 surface（可进一步优化）
surface_set_target(bm);
draw_clear_alpha(c_black, 1);

var off = offset * image_xscale;
draw_surface(application_surface, s * off, c * off);

surface_reset_target();


/// 4. 计算垂直向量（避免重复计算）
var px = -yy * 2;
var py =  xx * 2;

/// 5. 顶点（避免重复表达式）
var x1 = x - xx + px;
var y1 = y - yy + py;

var x2 = x - xx;
var y2 = y - yy;

var x3 = x + xx + px;
var y3 = y + yy + py;

var x4 = x + xx;
var y4 = y + yy;

/// 6. UV（建议限制范围）
var inv_w = 1 / room_width;
var inv_h = 1 / room_height;

/// 7. 绘制
var tex = surface_get_texture(bm);

draw_primitive_begin_texture(pr_trianglestrip, tex);

draw_vertex_texture_color(x1, y1, x1 * inv_w, y1 * inv_h, c_white, 1);
draw_vertex_texture_color(x2, y2, x2 * inv_w, y2 * inv_h, c_white, 1);
draw_vertex_texture_color(x3, y3, x3 * inv_w, y3 * inv_h, c_white, 1);
draw_vertex_texture_color(x4, y4, x4 * inv_w, y4 * inv_h, c_white, 1);

draw_primitive_end();

/// 8. Debug线（可选）
draw_line(x2, y2, x4, y4);