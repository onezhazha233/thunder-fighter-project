live;
if(rtime = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 130;
	laser.duration = 50;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",0,0,130,-40,50);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,40);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 50;
	laser.duration = 50;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",0,0,50,40,50);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,40);
	array_push(follow_inst,[laser,50,0]);
	
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 110;
	laser.duration = 22;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,110,-20,22);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,12);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 70;
	laser.duration = 22;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,70,20,22);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,12);
	array_push(follow_inst,[laser,50,0]);
}
if(rtime mod 18 = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 90;
	laser.duration = 18;
	laser.size = 1;
	laser.start_sprite = spr_bullet_player_glacier_d_start_big;
	laser.laser_sprite = spr_bullet_player_glacier_d_big;
	Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
	Anim_Create(laser,"light_alpha",0,0,1,-1,6,4);
	Anim_Create(laser,"light_image",0,0,0,2,6);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 90;
	laser.duration = 18;
	laser.size = 1;
	laser.start_sprite = spr_bullet_player_glacier_d_start_big;
	laser.laser_sprite = spr_bullet_player_glacier_d_big;
	Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
	Anim_Create(laser,"light_alpha",0,0,1,-1,6,4);
	Anim_Create(laser,"light_image",0,0,0,2,6);
	array_push(follow_inst,[laser,50,0]);
}
if(rtime mod 18 = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 140;
	laser.duration = 75;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,140,-50,75);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,65);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 40;
	laser.duration = 75;
	laser.start_sprite = spr_bullet_player_glacier_d_start;
	laser.glow_offset = 0;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,40,50,75);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,65);
	array_push(follow_inst,[laser,50,0]);
}

rtime += 1