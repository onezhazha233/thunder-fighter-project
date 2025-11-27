live;
laser_scale_target = laser_scale_level[weapon_level]

for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_phantom_a);
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_angle = 36*i+90;
		laser[i].laser_sprite = spr_bullet_player_phantom_a;
		laser[i].offset_speed = 15;
		laser[i].damage = damage;
		follow_inst[i] = laser[i];
	}
	else{
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_xscale = laser_scale;
		laser[i].laser_sprite = spr_bullet_player_phantom_a;
		laser[i].offset_speed = 15;
		laser[i].damage = damage;
	}
}