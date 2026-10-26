live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_b_intro)
blt.idle = seq_nuke_b
blt.collision_effect_sequence = seq_nuke_b_explosion
blt.collision_effect_duration = 12;
blt.collision_effect_radius = 100;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(27, 180, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_b_intro)
blt.idle = seq_nuke_b
blt.collision_effect_sequence = seq_nuke_b_explosion
blt.collision_effect_duration = 12;
blt.collision_effect_radius = 100;
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(27, -180, -22.5)