var frame = (-duration) mod 15;

// 根据帧数确定当前颜色过渡阶段
if (frame >= 0 && frame < 5) {
    // 第一阶段：colors[0] -> colors[1]
    var t = frame / 5;
    var r = floor((colors[0][0] * (1 - t)) + (colors[1][0] * t));
    var g = floor((colors[0][1] * (1 - t)) + (colors[1][1] * t));
    var b = floor((colors[0][2] * (1 - t)) + (colors[1][2] * t));
    image_blend = make_color_rgb(r, g, b);
}
else if (frame >= 5 && frame < 10) {
    // 第二阶段：colors[1] -> colors[2]
    var t = (frame - 5) / 5;
    var r = floor((colors[1][0] * (1 - t)) + (colors[2][0] * t));
    var g = floor((colors[1][1] * (1 - t)) + (colors[2][1] * t));
    var b = floor((colors[1][2] * (1 - t)) + (colors[2][2] * t));
    image_blend = make_color_rgb(r, g, b);
}
else {
    // 第三阶段：colors[2] -> colors[0]
    var t = (frame - 10) / 5;
    var r = floor((colors[2][0] * (1 - t)) + (colors[0][0] * t));
    var g = floor((colors[2][1] * (1 - t)) + (colors[0][1] * t));
    var b = floor((colors[2][2] * (1 - t)) + (colors[0][2] * t));
    image_blend = make_color_rgb(r, g, b);
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)

image_yscale = min(image_yscale+0.1,0.6)