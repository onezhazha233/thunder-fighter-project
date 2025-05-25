live;
MakePlayerBullet(x,y+20*scale_y,bullet_player_plane_apex_b_4);
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_apex_fire);
fire.sprite_index = spr_bullet_player_apex_abc_fire
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = 8