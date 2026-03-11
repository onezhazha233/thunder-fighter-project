time += 1

if (time <= 4) {
    var t = time / 4;
    speed = lerp(40, 60, t);
    target_xscale = lerp(base_xscale, max_xscale, t);
    target_yscale = lerp(base_yscale, max_yscale, t);
    image_blend = c_white;
} else {
    var cycle_time = (time - 4) mod 5;
    if (cycle_time <= 2) {
        var t_down = cycle_time / 2;
        target_xscale = lerp(max_xscale, min_xscale, t_down);
        target_yscale = lerp(max_yscale, min_yscale, t_down);
        var r = lerp(255, 130, t_down);
        var g = lerp(255, 35, t_down);
        var b = lerp(255, 100, t_down);
        image_blend = make_color_rgb(r, g, b);
    } else {
        var t_up = (cycle_time - 2) / 2; // 0..1
        target_xscale = lerp(min_xscale, max_xscale, t_up);
        target_yscale = lerp(min_yscale, max_yscale, t_up);
        var r = lerp(130, 255, t_up);
        var g = lerp(35, 255, t_up);
        var b = lerp(100, 255, t_up);
        image_blend = make_color_rgb(r, g, b);
    }
}

draw_sprite_ext(sprite_index,image_index,x,y,target_xscale*scale_x,target_yscale*scale_y,image_angle,image_blend,image_alpha)
