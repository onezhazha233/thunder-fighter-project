live;
angle = 45
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro)
a.idle = seq_missile_ab_rampage
a.collision_effect_scale_x = 1.5
a.collision_effect_scale_y = 1.5
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.speed += 2
a.track_inst = find_priority_enemy(bullet_player_missile)
a.damage = damage

angle = 135
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro)
a.idle = seq_missile_ab_rampage
a.collision_effect_scale_x = 1.5
a.collision_effect_scale_y = 1.5
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.speed += 2
a.track_inst = find_priority_enemy(bullet_player_missile)
a.damage = damage