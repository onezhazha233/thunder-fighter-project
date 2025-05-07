live;
a = instance_create_depth(x,y-20*scale_y,depth,bullet_player_plane_assault_b_5);
a.scale_x = scale_x;
a.scale_y = scale_y;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;