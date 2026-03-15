time += 1

speed = 30;
if(time <= 10){
    var t = time / 10;
    target_xscale = lerp(base_xscale, max_xscale, t);
    target_yscale = lerp(base_yscale, max_yscale, t);
}

draw_sprite_ext(sprite_index,image_index,x,y,target_xscale*scale_x,target_yscale*scale_y,image_angle,image_blend,image_alpha)