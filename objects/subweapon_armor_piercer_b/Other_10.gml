live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_intro)
blt.idle = seq_armor_piercer_b
blt.collision_effect = seq_bullet_effect_armor_piercer_bc
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, 90, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_intro)
blt.idle = seq_armor_piercer_b
blt.collision_effect = seq_bullet_effect_armor_piercer_bc
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, -90, -22.5)