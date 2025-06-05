live;
damage = 0.5

laser_scale = 1

for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_phantom_b);
		laser[i].image_angle = 36*i+90;
		laser[i].laser_sprite = spr_bullet_player_phantom_bc;
		laser[i].offset_speed = 45;
		laser[i].damage = damage;
		follow_inst[i] = laser[i];
	}
	else{
		laser[i].image_xscale = laser_scale;
		if!(laser[i].laser_sprite = spr_bullet_player_phantom_bc){
			laser[i].laser_sprite = spr_bullet_player_phantom_bc;
		}
		laser[i].offset_speed = 45;
		laser[i].damage = damage;
	}
}