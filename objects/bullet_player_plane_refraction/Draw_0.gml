live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(laser_sprite)*2)laser_offset = 0;
if(laser_offset <= -sprite_get_height(laser_sprite)*2)laser_offset = 0;

find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*0.4,enemy_agent,true,true)
len = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false&&_inst != root_enemy){
		len = _dist;
		find_enemy = _inst;
		break;
	}
}

fire_image += 0.25
gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
gpu_set_blendmode(bm_normal)

rampage = (laser_sprite == spr_bullet_player_phantom_a_rampage);
if(start = true){
	if(rampage = false){
		draw_sprite_ext(spr_bullet_player_phantom_a_start,fire_image,x+lengthdir_x(-15,image_angle)*scale_x,y+lengthdir_y(-15,image_angle)*scale_y,0.84*image_xscale*scale_x,image_yscale*scale_y,image_angle-90,-1,1);
	}
	else{
		draw_sprite_ext(spr_bullet_player_phantom_a_start_rampage,fire_image,x+lengthdir_x(-20,image_angle)*scale_x,y+lengthdir_y(-20,image_angle)*scale_y,0.88-sin(fire_image*(2*pi/3))*0.12,1.6+sin(fire_image*(2*pi/3))*0.2,image_angle-90,-1,1);
	}
}

extra_laser = false
if(instance_exists(find_enemy)){
	enemy = find_enemy;
	CollideSingleEnemy(enemy);
	if(rampage = false){
		effect_xscale = (10 + 0.035 * sin(fire_image*4))*0.5;
		effect_yscale = (10 + 0.12 * sin(fire_image*4))*0.5;
	}
	else{
		effect_xscale = 10 + 0.05 * sin(fire_image*4);
		effect_yscale = 10 + 0.05 * sin(fire_image*4);
	}
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_effect_phantom_a_point,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
	extra_laser = true;
	/*if(fire_image mod 0.5 = 0){
		a = instance_create_depth(ex,ey,0,bullet_effect_phantom_point);
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
	}*/
}

if(extra_laser_enabled = true){
	if(extra_laser = true){
		if!(instance_exists(extra_laser_inst)){
			extra_laser_inst = MakePlayerBullet(ex,ey,bullet_player_plane_refraction);
			extra_laser_inst.scale_x = scale_x;
			extra_laser_inst.scale_y = scale_y;
			extra_laser_inst.image_angle = -45;
			extra_laser_inst.laser_sprite = spr_bullet_player_phantom_a;
			extra_laser_inst.offset_speed = 15;
			extra_laser_inst.start = false;
			extra_laser_inst.extra_laser_enabled = false;
			extra_laser_inst.damage = damage;
			extra_laser_inst.root_enemy = find_enemy;
		}
		else{
			extra_laser_inst.x = ex;
			extra_laser_inst.y = ey;
			extra_laser_inst.scale_x = scale_x;
			extra_laser_inst.scale_y = scale_y;
			extra_laser_inst.image_xscale = image_xscale;
			extra_laser_inst.laser_sprite = spr_bullet_player_phantom_a;
			extra_laser_inst.offset_speed = 15;
			extra_laser_inst.damage = damage;
		}
	}
	else{
		if(instance_exists(extra_laser_inst)){
			instance_destroy(extra_laser_inst);
		}
	}
}