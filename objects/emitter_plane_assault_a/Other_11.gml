live;
damage = 2*global.atk_plane

MakePlayerBullet(x,y,bullet_player_plane_assault_a_6).damage = damage;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1;
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]