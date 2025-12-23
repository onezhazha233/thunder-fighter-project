live;
bullet = asset_get_index("bullet_player_plane_apex_d_"+string(weapon_level))
MakePlayerBullet(x,y,bullet).damage = damage;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_apex_fire);
fire.sprite_index = spr_bullet_player_apex_d_fire
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]
audio_play_sound(snd_plane_shoot,0,0)