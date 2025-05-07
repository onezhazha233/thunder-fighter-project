live;
a = instance_create_depth(x,y,depth,bullet_player_plane_assault_a_6);
a.scale_x = scale_x;
a.scale_y = scale_y;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;