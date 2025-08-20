live;
damage = 0.25*global.atk_wingman
for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_wingman_mega_a_rampage);
		laser[i].image_angle = 36*i;
		laser[i].damage = damage;
		array_push(follow_inst,laser[i]);
	}
}