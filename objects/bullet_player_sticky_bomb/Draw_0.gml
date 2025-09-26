live;
time += 1
draw_sprite_ext(flame,0,x+lengthdir_x(25,image_angle-90),y+lengthdir_y(25,image_angle-90),(image_xscale+cos(time)*0.2)*flame_scale,(image_yscale-cos(time)*0.2)*flame_scale,image_angle,-1,0.9+cos(time)*0.1)
draw_self()
if(following = 1){
	follow_enemy.last_bullet = id;
	event_user(0);
	follow_enemy.Hurt();
	gpu_set_blendmode(bm_add);
	//draw_sprite_ext(sprite_index,1,x,y,image_xscale*(2-alarm[1]/120),image_yscale*(2-alarm[1]/120),image_angle,-1,1-alarm[1]/120);
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,-1,1-alarm[1]/120);
	gpu_set_blendmode(bm_normal);
}

if(instance_exists(follow_enemy)){
	x = follow_enemy.x + follow_enemy_xo;
	y = follow_enemy.y + follow_enemy_yo;
}
else{
	if(following = 1){
		alarm[1] = 1;
	}
}