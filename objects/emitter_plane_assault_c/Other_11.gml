live;
MakePlayerBullet(x,y-40*scale_y,bullet_player_plane_assault_c_4).image_index = l1b;
l1b = !l1b;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]