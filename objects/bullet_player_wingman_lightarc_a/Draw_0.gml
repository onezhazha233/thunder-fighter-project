live;
if(image_xscale > 0){
	laser_offset += offset_speed;
	if(laser_offset >= sprite_get_height(laser_sprite)*2)laser_offset = 0;
	if(laser_offset <= -sprite_get_height(laser_sprite)*2)laser_offset = 0;

	find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*0.4,enemy_agent,true,true);
	len = find[0];
	if(instance_exists(find[1])&&find[1].inv_collision = true){
		len = range;
	}
	if(len = -1)len = range;

	fire_image += 0.25;
	gpu_set_blendmode(bm_add);
	draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha*0.7);
	//draw_laser(laser_sprite,0,x,y,laser_offset,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
	gpu_set_blendmode(bm_normal);

	if(instance_exists(find[1])&&find[1].inv_collision = false){
		enemy = find[1];
		CollideSingleEnemy(enemy);
		if(rampage = false){
			effect_xscale = (1.865 + 0.035 * sin(fire_image*4))*0.5;
			effect_yscale = (1.95 + 0.12 * sin(fire_image*4))*0.5;
		}
		else{
			effect_xscale = 1 + 0.05 * sin(fire_image*4);
			effect_yscale = 1 + 0.05 * sin(fire_image*4);
		}
		ex = x + lengthdir_x(len,image_angle);
		ey = y + lengthdir_y(len,image_angle);
		draw_sprite_ext(spr_bullet_effect_lightarc_a,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
	}
}