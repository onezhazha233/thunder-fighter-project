live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(laser_sprite)*(1+!rampage))laser_offset = 0;
if(laser_offset <= -sprite_get_height(laser_sprite)*(1+!rampage))laser_offset = 0;

find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*0.4,enemy_agent,true,true)
len = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		len = _dist;
		find_enemy = _inst;
		break;
	}
}

rampage = (laser_sprite == spr_bullet_player_phantom_d_rampage);

fire_image += 0.25
gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,fire_image,x,y,laser_offset,image_angle,len,!rampage,image_xscale*scale_x*(rampage = true ? (0.9+sin(fire_image*4)*0.1) : 1),image_yscale*scale_y,(rampage = true ? (0.9-sin(fire_image*4)*0.1) : 1))
draw_laser(laser_sprite,fire_image,x,y,laser_offset,image_angle,len,!rampage,image_xscale*scale_x*(rampage = true ? (0.9+sin(fire_image*4)*0.1) : 1),image_yscale*scale_y,(rampage = true ? (0.9-sin(fire_image*4)*0.1) : 1)/2)
gpu_set_blendmode(bm_normal)

if(rampage = false){
	draw_sprite_ext(spr_bullet_player_phantom_cd_start_rampage,0,x+lengthdir_x(-10,image_angle)*scale_x,y+lengthdir_y(-10,image_angle)*scale_y,(0.88-sin(fire_image*(3*pi/3))*0.12)*image_xscale*scale_x,(1.6+sin(fire_image*(3*pi/3))*0.2)*image_yscale*scale_y,image_angle-90,-1,1);
}
else{
	draw_sprite_ext(spr_bullet_player_phantom_d_start_rampage,fire_image,x+lengthdir_x(20,image_angle)*scale_x,y+lengthdir_y(20,image_angle)*scale_y,1.2*scale_x,1*scale_y,image_angle-90,-1,1);
}

if(rampage = false){
	if(fire_image mod 1 = 0){
		a = instance_create_depth(x+random_range(-20,20)*image_xscale*scale_x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_phantom_point);
		a.sprite_index = spr_bullet_effect_phantom_cd_point;
		a.direction = 90;
		a.depth = depth;
		scale = 2*image_xscale*scale_x;
		a.image_xscale = scale;
		a.image_yscale = scale*2;
		a.speed = 8*scale;
		a.friction = 0.1*scale;
	}
}

if(instance_exists(find_enemy)){
	enemy = find_enemy;
	CollideSingleEnemy(enemy);
	if(rampage = false){
		effect_xscale = (1.865 + 0.035 * sin(fire_image*4));
		effect_yscale = (1.95 + 0.12 * sin(fire_image*4));
	}
	else{
		effect_xscale = 2 + 0.05 * sin(fire_image*4);
		effect_yscale = 2 + 0.05 * sin(fire_image*4);
	}
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	if(rampage = false){
		draw_sprite_ext(spr_bullet_effect_phantom_cd,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
	}
	else{
		draw_sprite_ext(spr_bullet_effect_phantom_d_rampage,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
	}
	if(fire_image mod 0.5 = 0){
		a = instance_create_depth(ex,ey,0,bullet_effect_phantom_point);
		if(rampage = false){
			a.sprite_index = spr_bullet_effect_phantom_cd_point;
		}
		else{
			a.sprite_index = spr_bullet_effect_phantom_d_point_rampage;
		}
		a.direction = random_range(-20,-160);
		if(rampage = false){
			scale = 2*image_xscale*scale_x;
		}
		else{
			scale = 2*image_xscale*scale_x;
		}
		a.image_xscale = scale;
		a.image_yscale = scale;
		a.speed = 6*scale;
		a.friction = 0.2*scale;
	}
}