live;
laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
laser.image_angle = 120;
laser.duration = 34;
laser.damage = damage
Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,120,-30,34);
Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
array_push(follow_inst,[laser,-50,0]);

laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
laser.image_angle = 60;
laser.duration = 34;
laser.damage = damage
Anim_Create(laser,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,60,30,34);
Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
array_push(follow_inst,[laser,50,0]);