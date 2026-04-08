live;
angle = 45
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro)
blt.idle = seq_missile_ab_rampage
blt.collision_effect_scale_x = 1.5
blt.collision_effect_scale_y = 1.5
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.speed += 2
blt.track_inst = find_priority_enemy(bullet_player_missile)
blt.damage = damage

angle = 135
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro)
blt.idle = seq_missile_ab_rampage
blt.collision_effect_scale_x = 1.5
blt.collision_effect_scale_y = 1.5
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.speed += 2
blt.track_inst = find_priority_enemy(bullet_player_missile)
blt.damage = damage