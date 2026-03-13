live;
image_xscale = scale_x;
image_yscale = scale_y;

// update flame
flame_timer -= 1;
if(flame_timer <= 0){
	var f = {ox:lengthdir_x(12*scale_x,image_angle-90),oy:lengthdir_y(12*scale_y,image_angle-90),scale:flame_scale,alpha:flame_alpha};
	array_push(flame_list,f);
	flame_timer = flame_interval;
}

for(var i = array_length(flame_list)-1; i >= 0; i--){
	var f = flame_list[i];
	f.ox += lengthdir_x(flame_speed*scale_x,image_angle-90);
	f.oy += lengthdir_y(flame_speed*scale_y,image_angle-90);
	f.scale -= 0.15;
	f.alpha -= 0.04;
	if(f.scale <= 0 || f.alpha <= 0){
		array_delete(flame_list,i,1);
		continue;
	}
	flame_list[i] = f;
}

gpu_set_blendmode(bm_add);
for(var i = 0; i < array_length(flame_list); i++){
	var f = flame_list[i];
	draw_sprite_ext(spr_bullet_player_overwatcher_drone_flame,0,x+f.ox,y+f.oy,f.scale*scale_x,f.scale*scale_y,image_angle,c_white,f.alpha);
}
gpu_set_blendmode(bm_normal);

draw_self();