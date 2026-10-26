live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_a_intro)
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, 90, -22.5)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_a_intro)
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.damage = damage
blt.SetStandby(24, -90, -22.5)