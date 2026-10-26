live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_d_explosion
blt.collision_effect_duration = 20;
blt.collision_effect_radius = 110;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(27, 135, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_d_explosion
blt.collision_effect_duration = 20;
blt.collision_effect_radius = 110;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.dir = 1
blt.damage = damage
blt.SetStandby(27, -135, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_d_explosion
blt.collision_effect_duration = 20;
blt.collision_effect_radius = 110;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(30, 225, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_d_explosion
blt.collision_effect_duration = 20;
blt.collision_effect_radius = 110;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.dir = 1
blt.damage = damage
blt.SetStandby(30, -225, -22.5)