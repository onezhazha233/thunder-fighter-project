live;
for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_blade_line);
		laser[i].image_angle = 36*i+90;
		follow_inst[i] = laser[i];
	}
}