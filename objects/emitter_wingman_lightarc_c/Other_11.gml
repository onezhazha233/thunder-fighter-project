live;
rampage_time += 1
if!(instance_exists(laser[2])){
	laser[2] = MakePlayerBullet(x,y,bullet_player_wingman_lightarc_a);
	laser[2].image_angle = 90;
	laser[2].damage = damage;
	laser[2].duration = -1;
	laser[2].image_xscale = 1;
	laser[2].rampage = true;
	array_push(follow_inst,laser[2]);
}
else{
	laser[2].image_angle = 90+angle_range/2-cos(rampage_time/10)*angle_range/2;
}
if!(instance_exists(laser[3])){
	laser[3] = MakePlayerBullet(x,y,bullet_player_wingman_lightarc_a);
	laser[3].image_angle = 90;
	laser[3].damage = damage;
	laser[3].duration = -1;
	laser[3].image_xscale = 1;
	laser[3].rampage = true;
	array_push(follow_inst,laser[3]);
}
else{
	laser[3].image_angle = 90-angle_range/2+cos(rampage_time/10)*angle_range/2;
}