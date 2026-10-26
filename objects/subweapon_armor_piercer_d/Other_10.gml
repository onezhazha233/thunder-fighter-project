live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
blt.idle = seq_armor_piercer_cd
blt.collision_effect = seq_bullet_effect_armor_piercer_d
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, 90, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
blt.idle = seq_armor_piercer_cd
blt.collision_effect = seq_bullet_effect_armor_piercer_d
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, -90, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
blt.idle = seq_armor_piercer_cd
blt.collision_effect = seq_bullet_effect_armor_piercer_d
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(27, 180, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
blt.idle = seq_armor_piercer_cd
blt.collision_effect = seq_bullet_effect_armor_piercer_d
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(27, -180, -22.5)