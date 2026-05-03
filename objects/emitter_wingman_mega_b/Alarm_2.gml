live;
for(i=0;i<1;i+=1){
	instance_destroy(laser[i]);
	laser[i] = MakePlayerBullet(x,y,bullet_player_wingman_mega);
	laser[i].image_angle = 36*i+90;
	laser[i].damage = damage;
	with(laser[i]){
		start_sprite = spr_bullet_player_mega_b_start;
		laser_sprite = spr_bullet_player_mega_b;
		xscale = 1.1;
		image_alpha = 0.8;
		image_xscale = xscale;
		Anim_Create(id,"image_alpha",0,0,0.8,0.2,2);
		Anim_Create(id,"image_alpha",0,0,1,-1,6,16);
		Anim_Create(id,"image_xscale",0,0,xscale,-xscale,20,2);
		Anim_Create(id,"width",0,0,width,-width,20,2);
		Anim_Create(id,"image_index",0,0,0,1,0,8);
		Anim_Create(id,"image_index",0,0,1,1,0,16);
		duration = 22;
	}
	array_push(follow_inst,[laser[i],-10]);
}