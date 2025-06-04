live;
for(i=0;i<3;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_blade_line_c);
		laser[i].image_angle = 90;
		laser[i].x_offset = -78+78*i;
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		if!(i = 1)laser[i].laser_offset += 280;
		laser[i].rampage = rampage;
		laser[i].edge_sequence_enabled = false;
		laser[i].slash_damage = damages[4];
		follow_inst[i] = laser[i];
		//if(i = 1)laser[i].edge_sequence_enabled = false;
	}
	else{
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		laser[i].edge_cdd = 18;
		if(instance_exists(laser[1]))laser[1].edge_cdd = 30;
		laser[i].rampage = rampage;
		laser[i].slash_damage = damages[4];
	}
}