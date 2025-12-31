live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(laser_sprite))laser_offset = 0;
if(laser_offset <= -sprite_get_height(laser_sprite))laser_offset = 0;

fire_image += 0.25

refraction_angle[0] = image_angle

ignoreInstances = []
refraction_amount_valid = 0
refraction_length = [range]

for(i=0;i<refraction_amount;i+=1){
	if(i = 0){
		refraction_start_x = [x];
		refraction_start_y = [y];
	}
	find = laser_find_width(refraction_start_x[i],refraction_start_y[i],refraction_angle[i],range,abs(sprite_get_width(laser_sprite)*image_xscale*scale_x*0.4),enemy_agent,true,true,ignoreInstances)
	refraction_length[i] = range;
	find_enemy = noone;
	for(j=0;j<array_length(find);j+=1){
	    var _inst = find[j][0];
	    var _dist = find[j][1];
	    if(_inst.inv_collision = false){
			refraction_length[i] = _dist;
			find_enemy = _inst;
			break;
		}
	}
	
	refraction_angle[1] = lerp(image_angle,image_angle+60*(flip = 1 ? -1 : 1),refraction_length[0]/1280);

	//gpu_set_blendmode(bm_add)
	draw_laser(laser_sprite,0,refraction_start_x[i],refraction_start_y[i],laser_offset,refraction_angle[i],refraction_length[i],false,image_xscale*scale_x,image_yscale*scale_y,image_alpha,false,flip)
	//draw_laser(laser_sprite,0,refraction_start_x[i],refraction_start_y[i],laser_offset,refraction_angle[i],refraction_length[i],true,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
	//gpu_set_blendmode(bm_normal)

	extra_laser = false

	if(instance_exists(find_enemy)){
		enemy = find_enemy;
		CollideSingleEnemy(enemy);
		ignoreInstances[i] = enemy;
		if(rampage = false){
			effect_xscale = (10 + 0.035 * sin(fire_image*4))*0.5;
			effect_yscale = (10 + 0.12 * sin(fire_image*4))*0.5;
		}
		else{
			effect_xscale = 10 + 0.05 * sin(fire_image*4);
			effect_yscale = 10 + 0.05 * sin(fire_image*4);
		}
		ex = refraction_start_x[i] + lengthdir_x(refraction_length[i],refraction_angle[i]);
		ey = refraction_start_y[i] + lengthdir_y(refraction_length[i],refraction_angle[i]);
		//draw_sprite_ext(spr_bullet_effect_phantom_a_point,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
		extra_laser = true;
		
		refraction_start_x[i+1] = ex;
		refraction_start_y[i+1] = ey;
		
		refraction_amount_valid += 1;
	}
	else{
		break;
	}
}

if(rampage = false){
	effect_xscale = 2 + 0.05 * sin(fire_image*4);
	effect_yscale = 2 + 0.05 * sin(fire_image*4);
}
else{
	effect_xscale = 2 + 0.05 * sin(fire_image*4);
	effect_yscale = 2 + 0.05 * sin(fire_image*4);
}
for(i=0;i<refraction_amount_valid;i+=1){
	ex = refraction_start_x[i] + lengthdir_x(refraction_length[i],refraction_angle[i]);
	ey = refraction_start_y[i] + lengthdir_y(refraction_length[i],refraction_angle[i]);
	draw_sprite_ext(spr_bullet_effect_refraction,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
}

rampage = (laser_sprite == spr_bullet_player_refraction_rampage);
if(start = true){
	if(rampage = false){
		draw_sprite_ext(spr_bullet_player_phantom_cd_start_rampage,fire_image,x+lengthdir_x(-15,image_angle)*scale_x,y+lengthdir_y(-15,image_angle)*scale_y,0.84*image_xscale*scale_x,image_yscale*scale_y,image_angle-90,-1,1);
	}
	else{
		draw_sprite_ext(spr_bullet_player_phantom_d_start_rampage,fire_image,x+lengthdir_x(-20,image_angle)*scale_x,y+lengthdir_y(-20,image_angle)*scale_y,0.88-sin(fire_image*(2*pi/3))*0.12,1.6+sin(fire_image*(2*pi/3))*0.2,image_angle-90,-1,1);
	}
}