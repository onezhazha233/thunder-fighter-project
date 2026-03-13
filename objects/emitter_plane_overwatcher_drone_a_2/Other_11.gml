live;
laser = MakePlayerBullet(x,y,bullet_player_plane_overwatcher_laser)
laser.image_angle = image_angle + 90
laser.damage = damage
array_push(follow_inst,[laser,15]);