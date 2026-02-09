live;
angle = 45
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.track_inst = find_priority_enemy(bullet_player_missile)
blt.damage = damage

angle = 135
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.track_inst = find_priority_enemy(bullet_player_missile)
blt.damage = damage