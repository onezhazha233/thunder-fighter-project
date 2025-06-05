live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(laser_sprite)*2)laser_offset = 0;
if(laser_offset <= -sprite_get_height(laser_sprite)*2)laser_offset = 0;

find = laser_find(x,y,image_angle,range,enemy_agent,true,true)
len = find[0]
if(len = -1)len = range;

fire_image += 0.25
gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
gpu_set_blendmode(bm_normal)

rampage = (laser_sprite == spr_bullet_player_phantom_bc);
if(rampage = false){
	draw_sprite_ext(spr_bullet_player_phantom_bc_start,fire_image,x+lengthdir_x(-15,image_angle)*scale_x,y+lengthdir_y(-15,image_angle)*scale_y,0.84*image_xscale*scale_x,image_yscale*scale_y,image_angle-90,-1,1);
}
else{
	draw_sprite_ext(spr_bullet_player_phantom_b_start_rampage,fire_image,x+lengthdir_x(-20,image_angle)*scale_x,y+lengthdir_y(-20,image_angle)*scale_y,0.88-sin(fire_image*(2*pi/3))*0.12,1.6+sin(fire_image*(2*pi/3))*0.2,image_angle-90,-1,1);
}

if(instance_exists(find[1])){
	enemy = find[1];
	enemy.last_bullet = id;
	CollideEnemy(enemy);
	if(rampage = false){
		effect_xscale = (1.865 + 0.035 * sin(fire_image*4))*0.5;
		effect_yscale = (1.95 + 0.12 * sin(fire_image*4))*0.5;
	}
	else{
		effect_xscale = 2 + 0.05 * sin(fire_image*4);
		effect_yscale = 2 + 0.05 * sin(fire_image*4);
	}
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_effect_phantom_b,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
	if(fire_image mod 0.5 = 0){
		a = instance_create_depth(ex,ey,0,bullet_effect_phantom_point);
		a.sprite_index = spr_bullet_effect_phantom_b_point;
		a.direction = random_range(-20,-160);
		if(rampage = false){
			scale = image_xscale*scale_x;
		}
		else{
			scale = 2*image_xscale*scale_x;
		}
		a.image_xscale = scale;
		a.image_yscale = scale;
		a.speed = 4*scale;
		a.friction = 0.2*scale;
	}
}