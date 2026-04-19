live;
if(state < 2)draw_sprite_ext(sprite_ball,0,x+lengthdir_x(ball_offset,image_angle),y+lengthdir_y(ball_offset,image_angle),ball_scale_x,ball_scale_y,image_angle,-1,1);
if(state = 0){
	draw_sprite_ext(sprite_ring,0,x,y,ring_scale,ring_scale,image_angle,-1,lerp(0.2,0.5,(5-ring_scale)/5));
	for(i=0;i<3;i+=1){
		draw_sprite_ext(sprite_ball,0,x+lengthdir_x(effect_dist[i],effect_dir[i]),y+lengthdir_y(effect_dist[i],effect_dir[i]),effect_dist[i]/60,0.15,effect_dir[i],-1,0.8);
	}
}
if(state >= 2){
	if(laser_scale > 0){
		find = laser_find_width(x,y,image_angle,1500,10,bullet_enemy_block,true,true);
		length = 1500;
		if(array_length(find) > 0){
			length = find[0][1];
			if(time mod 5 = 0){
				find[0][0].OnBlock();
			}
		}
		if(length > 40)draw_laser(sprite_laser,laser_image,x+lengthdir_x(40,image_angle),y+lengthdir_y(40,image_angle),0,image_angle,length-40,false,laser_scale,1,image_alpha);
		draw_laser(sprite_laser_start,laser_image,x,y,0,image_angle,length,false,laser_scale,1,image_alpha,true);
		if(array_length(find) > 0){
			ex = x + lengthdir_x(length,image_angle);
			ey = y + lengthdir_y(length,image_angle);
			draw_sprite_ext(sprite_effect,0,ex,ey,laser_scale*choose(1,-1),laser_scale*image_xscale/0.8,choose(0,180)+image_angle+90,-1,image_alpha);
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
}
