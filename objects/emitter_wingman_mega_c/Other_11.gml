live;
for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_wingman_mega_c);
		laser[i].image_angle = 36*i+90;
		laser[i].damage = damage;
		laser[i].rampage = true;
		with(laser[i]){
			image_alpha = 0.8;
			image_index = 1;
			Anim_Create(id,"image_alpha",0,0,0.8,0.2,6);
			Anim_Create(id,"image_xscale",0,0,0,1.4,4);
			Anim_Create(id,"image_index",0,0,1,-1,0,4);
			alarm[1] = 6;
		}
		array_push(follow_inst,[laser[i],-16]);
	}
}