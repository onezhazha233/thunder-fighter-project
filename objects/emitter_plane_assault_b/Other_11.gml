live;
MakePlayerBullet(x,y-20*scale_y,bullet_player_plane_assault_b_5).damage = damage;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]
audio_play_sound(snd_plane_shoot,0,0)