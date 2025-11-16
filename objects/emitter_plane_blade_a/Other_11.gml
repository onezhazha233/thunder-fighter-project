live;
for(i=0;i<3;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_blade_line_a);
		laser[i].image_angle = 90;
		laser[i].x_offset = -laser_offset+laser_offset*i;
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		if!(i = 1)laser[i].laser_offset += 280;
		laser[i].rampage = rampage;
		laser[i].edge_sequence_enabled = false;
		laser[i].slash_damage = damage;
		follow_inst[i] = laser[i];
	}
	else{
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		laser[i].edge_cdd = 18;
		if(instance_exists(laser[1]))laser[1].edge_cdd = 30;
		laser[i].rampage = rampage;
		laser[i].slash_damage = damage;
		
		laser_offset += (78-laser_offset)/12;
		if(abs(78-laser_offset) < 0.1)laser_offset = 78;
		laser[i].x_offset = -laser_offset+laser_offset*i;
	}
}