live;
if(rtime = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 122;
	laser.duration = 50;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",0,0,122,-32,50);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,40);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 58;
	laser.duration = 50;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",0,0,58,32,50);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,40);
	array_push(follow_inst,[laser,50,0]);
	
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 102;
	laser.duration = 22;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",0,0,102,-12,22);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,12);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 78;
	laser.duration = 22;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",0,0,78,12,22);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,12);
	array_push(follow_inst,[laser,50,0]);
}
if(rtime mod 18 = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 90;
	laser.duration = 18;
	laser.size = 1;
	laser.damage = damage*2;
	laser.start_sprite = spr_bullet_player_glacier_abc_start_big;
	laser.laser_sprite = spr_bullet_player_glacier_ab_big;
	Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
	Anim_Create(laser,"light_alpha",0,0,1,-1,6);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 90;
	laser.duration = 18;
	laser.size = 1;
	laser.damage = damage*2;
	laser.start_sprite = spr_bullet_player_glacier_abc_start_big;
	laser.laser_sprite = spr_bullet_player_glacier_ab_big;
	Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
	Anim_Create(laser,"light_alpha",0,0,1,-1,6);
	array_push(follow_inst,[laser,50,0]);
}
if(rtime mod 22 = 0){
	laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
	laser.image_angle = 135;
	laser.duration = 75;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,135,-45,75);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,65);
	array_push(follow_inst,[laser,-50,0]);

	laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
	laser.image_angle = 45;
	laser.duration = 75;
	laser.damage = damage;
	Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,45,45,75);
	Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,65);
	array_push(follow_inst,[laser,50,0]);
}

rtime += 1