live;
a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_a_intro)
a.hspeed = 17/3
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_a_intro)
a.hspeed = -17/3
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)