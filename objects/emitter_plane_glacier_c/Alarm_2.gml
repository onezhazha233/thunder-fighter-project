live;
laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
laser.image_angle = 90;
laser.duration = 18;
laser.size = 1;
laser.damage = damage*2
laser.start_sprite = spr_bullet_player_glacier_abc_start_big;
laser.laser_sprite = spr_bullet_player_glacier_c_big;
Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
Anim_Create(laser,"light_alpha",0,0,1,-1,6);
array_push(follow_inst,[laser,-50,0]);

laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
laser.image_angle = 90;
laser.duration = 18;
laser.size = 1;
laser.damage = damage*2
laser.start_sprite = spr_bullet_player_glacier_abc_start_big;
laser.laser_sprite = spr_bullet_player_glacier_c_big;
Anim_Create(laser,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.5,-1.4,18);
Anim_Create(laser,"light_alpha",0,0,1,-1,6);
array_push(follow_inst,[laser,50,0]);

audio_play_sound(snd_plane_glacier_laser_big,0,0);