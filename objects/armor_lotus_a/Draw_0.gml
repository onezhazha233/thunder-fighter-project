live;
if(item_count = 5){
	if(abs(light_alpha-1) > 0.01){
		light_alpha += (1-light_alpha)/3;
	}
	else{
		light_alpha = 1;
	}
}
else{
	if(abs(light_alpha) > 0.01){
		light_alpha += (0-light_alpha)/3;
	}
	else{
		light_alpha = 0;
	}
}

gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_effect_timedom_light,0,player.x,player.y,1,1,-current_time/1000*game_get_speed(gamespeed_fps)*0.37,-1,light_alpha)
gpu_set_blendmode(bm_normal)