live;
for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_blade_line_d);
		laser[i].image_angle = 36*i+90;
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		laser[i].slash_damage = damages[weapon_level];
		follow_inst[i] = laser[i];
		//if(i = 1)laser[i].edge_sequence_enabled = false;
	}
	else{
		laser[i].edge_x = x;
		laser[i].edge_y = y;
		laser[i].edge_cdd = edge_cds[weapon_level];
		laser[i].rampage = rampage;
		laser[i].slash_damage = damages[weapon_level];
	}
}