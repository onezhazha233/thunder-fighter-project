live;
laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
laser.image_angle = 116;
laser.duration = 34;
laser.start_sprite = spr_bullet_player_glacier_d_start;
laser.glow_offset = 0;
Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,116,-26,34);
Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
array_push(follow_inst,[laser,-50,0]);

laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
laser.image_angle = 64;
laser.duration = 34;
laser.start_sprite = spr_bullet_player_glacier_d_start;
laser.glow_offset = 0;
Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,64,26,34);
Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
array_push(follow_inst,[laser,50,0]);