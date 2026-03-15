live;
if(image_xscale > 0){
	laser_stripe_offset += laser_stripe_speed;
	if(laser_stripe_offset >= sprite_get_height(spr_bullet_player_sentinel_laser_stripe))laser_stripe_offset = 0;

	find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*0.4,enemy_agent,true,true)
	length = range;
	find_enemy = noone;
	for(i=0;i<array_length(find);i+=1){
	    var _inst = find[i][0];
	    var _dist = find[i][1];
	    if(_inst.inv_collision = false){
			length = _dist;
			find_enemy = _inst;
			break;
		}
	}

	fire_image += 0.25;
	
	draw_laser(laser_sprite,0,x,y,0,image_angle,length,0,image_xscale*scale_x,image_yscale*scale_y,image_alpha,0,0,image_blend);
	draw_laser(spr_bullet_player_sentinel_laser_stripe,0,x,y,laser_stripe_offset,image_angle,length,0,image_xscale*scale_x,image_yscale*scale_y*1.5,1);

	if(instance_exists(find_enemy)&&find_enemy.inv_collision = false){
		enemy = find_enemy;
		CollideSingleEnemy(enemy);
		effect_xscale = (1 + 0.035 * sin(fire_image*4));
		effect_yscale = (1 + 0.12 * sin(fire_image*4));
		ex = x + lengthdir_x(length,image_angle);
		ey = y + lengthdir_y(length,image_angle);
		draw_sprite_ext(spr_bullet_effect_phantom_cd,0,ex,ey,effect_xscale*image_xscale*scale_x,effect_yscale*image_xscale*scale_y,0,-1,1);
		if(fire_image mod 0.5 = 0){
			a = instance_create_depth(ex,ey,0,bullet_effect_phantom_point);
			a.sprite_index = spr_bullet_effect_phantom_cd_point;
			a.direction = random_range(-20,-160);
			scale = image_xscale*scale_x;
			a.image_xscale = scale;
			a.image_yscale = scale;
			a.speed = 6*scale;
			a.friction = 0.2*scale;
		}
	}
}