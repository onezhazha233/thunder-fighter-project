live;
damage = 0.4305

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_d
a.hspeed = 17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-45,0,24)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_d
a.hspeed = -17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-45,0,24)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_d
a.hspeed = 34/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,35,27)
Anim_Create(a,"ospd",0,0,0,-45,0,27)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_cd_rampage_intro)
a.idle = seq_armor_piercer_cd_rampage
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_d
a.hspeed = -34/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,35,27)
Anim_Create(a,"ospd",0,0,0,-45,0,27)