live;
a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
a.idle = seq_armor_piercer_cd
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_bc
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_intro)
a.idle = seq_armor_piercer_cd
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_bc
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)