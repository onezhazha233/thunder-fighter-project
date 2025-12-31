live;
laser_scale_target = 1

if!(instance_exists(follow_inst[0,0])){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_refraction);
	laser.scale_x = scale_x;
	laser.scale_y = scale_y;
	laser.image_angle = 36*i+90;
	laser.laser_sprite = spr_bullet_player_refraction_rampage;
	laser.offset_speed = 60;
	laser.damage = damage;
	follow_inst[0] = [laser,-50,0];
}
else{
	follow_inst[0,0].scale_x = scale_x;
	follow_inst[0,0].scale_y = scale_y;
	follow_inst[0,0].image_xscale = laser_scale;
	if!(follow_inst[0,0].laser_sprite = spr_bullet_player_refraction_rampage){
		follow_inst[0,0].laser_sprite = spr_bullet_player_refraction_rampage;
	}
	follow_inst[0,0].offset_speed = 60;
	follow_inst[0,0].damage = damage;
}

if!(instance_exists(follow_inst[1,0])){
	laser = MakePlayerBullet(x+50,y,bullet_player_plane_refraction);
	laser.scale_x = scale_x;
	laser.scale_y = scale_y;
	laser.image_angle = 36*i+90;
	laser.laser_sprite = spr_bullet_player_refraction_rampage;
	laser.offset_speed = 60;
	laser.damage = damage;
	laser.flip = 1;
	follow_inst[1] = [laser,50,0];
}
else{
	follow_inst[1,0].scale_x = scale_x;
	follow_inst[1,0].scale_y = scale_y;
	follow_inst[1,0].image_xscale = laser_scale;
	if!(follow_inst[1,0].laser_sprite = spr_bullet_player_refraction_rampage){
		follow_inst[1,0].laser_sprite = spr_bullet_player_refraction_rampage;
	}
	follow_inst[1,0].offset_speed = 60;
	follow_inst[1,0].damage = damage;
}