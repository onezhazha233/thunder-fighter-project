live;
var bg_h = GetBgHeight()
var room_w = room_width;
var room_h = room_height;

// 起始绘制的 y 坐标
var draw_y = -bg_offset;

// 计算需要绘制的次数
var draw_count = ceil(room_h / bg_h) + 1;

// 循环绘制背景图
for (var i = 0; i < draw_count; i++) {
	DrawBg(draw_y + i * bg_h)
}