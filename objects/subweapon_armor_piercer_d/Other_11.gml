live;
a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect = seq_bullet_effect_armor_piercer_d
a.scale_x = scale_x
a.scale_y = scale_y
a.damage = damage
a.SetStandby(24, 90, -45)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect = seq_bullet_effect_armor_piercer_d
a.scale_x = -scale_x
a.scale_y = scale_y
a.damage = damage
a.SetStandby(24, -90, -45)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect = seq_bullet_effect_armor_piercer_d
a.scale_x = scale_x
a.scale_y = scale_y
a.damage = damage
a.SetStandby(27, 180, -45)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect = seq_bullet_effect_armor_piercer_d
a.scale_x = -scale_x
a.scale_y = scale_y
a.damage = damage
a.SetStandby(27, -180, -45)