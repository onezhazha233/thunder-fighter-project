live;
laser_scale_target = laser_scale_level[weapon_level]
if(abs(laser_scale - laser_scale_target) > 0.01){
	laser_scale += (laser_scale_target - laser_scale)/5;
}
else{
	laser_scale = laser_scale_target;
}

for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_phantom_d);
		laser[i].image_xscale = laser_scale_level[weapon_level];
		laser[i].image_angle = 36*i+90;
		laser[i].laser_sprite = spr_bullet_player_phantom_d;
		laser[i].offset_speed = 12;
		follow_inst[i] = laser[i];
	}
	else{
		laser[i].image_xscale = laser_scale;
		laser[i].laser_sprite = spr_bullet_player_phantom_d;
		laser[i].offset_speed = 12;
	}
}