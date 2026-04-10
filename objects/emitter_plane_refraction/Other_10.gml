live;
laser_scale_target = laser_scale_level[weapon_level]

if!(instance_exists(follow_inst[0,0])){
	laser[0] = MakePlayerBullet(x-50,y,bullet_player_plane_refraction);
	laser[0].scale_x = scale_x;
	laser[0].scale_y = scale_y;
	laser[0].image_angle = 36*i+90;
	laser[0].laser_sprite = spr_bullet_player_refraction;
	laser[0].offset_speed = 35;
	laser[0].damage = damage;
	follow_inst[0] = [laser[0],-50,0];
}
else{
	follow_inst[0,0].scale_x = scale_x;
	follow_inst[0,0].scale_y = scale_y;
	follow_inst[0,0].image_xscale = laser_scale;
	follow_inst[0,0].laser_sprite = spr_bullet_player_refraction;
	follow_inst[0,0].offset_speed = 35;
	follow_inst[0,0].damage = damage;
}

if!(instance_exists(follow_inst[1,0])){
	laser[1] = MakePlayerBullet(x+50,y,bullet_player_plane_refraction);
	laser[1].scale_x = scale_x;
	laser[1].scale_y = scale_y;
	laser[1].image_angle = 36*i+90;
	laser[1].laser_sprite = spr_bullet_player_refraction;
	laser[1].offset_speed = 35;
	laser[1].damage = damage;
	laser[1].flip = 1;
	follow_inst[1] = [laser[1],50,0];
}
else{
	follow_inst[1,0].scale_x = scale_x;
	follow_inst[1,0].scale_y = scale_y;
	follow_inst[1,0].image_xscale = laser_scale;
	follow_inst[1,0].laser_sprite = spr_bullet_player_refraction;
	follow_inst[1,0].offset_speed = 35;
	follow_inst[1,0].damage = damage;
}