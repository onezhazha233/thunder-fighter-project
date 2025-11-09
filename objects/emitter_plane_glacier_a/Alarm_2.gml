live;
laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier_a_big)
laser.image_angle = 90
laser.duration = 18
Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18)
Anim_Create(laser,"light",0,0,1,-1,6)
array_push(follow_inst,[laser,-50,0])

laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier_a_big)
laser.image_angle = 90
laser.duration = 18
Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18)
Anim_Create(laser,"light",0,0,1,-1,6)
array_push(follow_inst,[laser,+50,0])