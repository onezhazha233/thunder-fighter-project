live;
time += 1
surface_set_target(surf);
draw_clear_alpha(0,0);
draw_sprite_ext(sprite_laser_start,0,sprite_get_width(sprite_laser_start)/2,0,laser_scale,-1,0,-1,1);
draw_sprite_ext(sprite_laser,0,sprite_get_width(sprite_laser_start)/2,sprite_get_height(sprite_laser_start)-10,laser_scale,-1500,0,-1,1);
surface_reset_target();

if(laser_scale > 0){
	find = laser_find_width(x,y,image_angle,1500,laser_width,bullet_enemy_block,true,true);
	length = 1500;
	if(array_length(find) > 0){
		length = find[0][1];
		if(time mod 5 = 0){
			find[0][0].OnBlock();
		}
	}
	draw_surface_general(surf,0,0,sprite_get_width(sprite_laser_start),length,x+lengthdir_x(sprite_get_width(sprite_laser_start)/2,image_angle+90),y+lengthdir_y(sprite_get_width(sprite_laser_start)/2,image_angle+90),1,-1,image_angle-90,-1,-1,-1,-1,image_alpha);
	if(array_length(find) > 0){
		ex = x + lengthdir_x(length,image_angle);
		ey = y + lengthdir_y(length,image_angle);
		draw_sprite_ext(sprite_effect,0,ex,ey,laser_scale*choose(1,-1),laser_scale*image_xscale,choose(0,180)+image_angle+90,-1,image_alpha);
	}
	find_player = laser_find_width(x,y,image_angle,length,10,player,true,true);
	if(array_length(find_player) > 0){
		if(laser_scale > 0.2){
			if(Player_IsEnabled()){
				if(global.inv_hurt = 0&&global.inv_shield = 0){
					event_user(0);
					Player_CallHurtEvent();
				}
			}
		}
	}
}