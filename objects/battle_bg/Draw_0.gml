live;
for(var i=0;i<array_length(bg_images);i+=1){
	var bg_h = bg_height[i];
	var room_h = room_height;

	// 起始绘制的 y 坐标
	var draw_y = -bg_offset[i];

	// 计算需要绘制的次数
	var draw_count = ceil(room_h / bg_h) + 1;

	// 循环绘制背景图
	for(var j = 0; j < draw_count; j++) {
		DrawBg(draw_y + j * bg_h,bg_images[i])
	}
}