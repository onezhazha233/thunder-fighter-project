time += 1

if (time <= 4) {
    var t = time / 4;
    speed = lerp(40, 60, t);
    target_xscale = lerp(base_xscale, max_xscale, t);
    target_yscale = lerp(base_yscale, max_yscale, t);
} else {
    var cycle_time = (time - 4) mod 5;
    if (cycle_time <= 2) {
        var t_down = cycle_time / 2; // 0..1
        target_xscale = lerp(max_xscale, base_xscale, t_down);
    } else {
        var t_up = (cycle_time - 2) / 2;
        target_xscale = lerp(base_xscale, max_xscale, t_up);
    }
    target_yscale = max_yscale;
}

draw_sprite_ext(sprite_index,image_index,x,y,target_xscale*scale_x,target_yscale*scale_y,image_angle,image_blend,image_alpha)