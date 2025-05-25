live;
MakePlayerBullet(x,y-60*scale_y,bullet_player_plane_assault_d_4).image_index = l1b;
l1b = !l1b;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.sprite_index = spr_bullet_player_assault_d_fire
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -20