live;
angle = 45
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.track_inst = enemy_agent
angle = 135
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.track_inst = enemy_agent