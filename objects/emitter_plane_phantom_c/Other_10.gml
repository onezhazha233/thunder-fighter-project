live;
switch(weapon_level){
	case 0:damage = 0.125*global.atk_plane;break;
	case 1:damage = 0.125*1.3*global.atk_plane;break;
	case 2:damage = 0.125*1.7*global.atk_plane;break;
	case 3:damage = 0.25*global.atk_plane;break;
}

laser_scale_target = laser_scale_level[weapon_level]
if(abs(laser_scale - laser_scale_target) > 0.01){
	laser_scale += (laser_scale_target - laser_scale)/5;
}
else{
	laser_scale = laser_scale_target;
}

for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_phantom_c);
		laser[i].image_xscale = laser_scale_level[weapon_level];
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_angle = 36*i+90;
		laser[i].laser_sprite = spr_bullet_player_phantom_bc;
		laser[i].offset_speed = laser_speed[weapon_level];
		laser[i].damage = damage;
		follow_inst[i] = laser[i];
	}
	else{
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_xscale = laser_scale;
		laser[i].laser_sprite = spr_bullet_player_phantom_bc;
		laser[i].offset_speed = laser_speed[weapon_level];
		laser[i].damage = damage;
	}
}