live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_rampage_intro)
blt.idle = seq_armor_piercer_b_rampage
blt.collision_effect = seq_bullet_effect_armor_piercer_bc
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.hspeed = 17/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,2-blt.hspeed,24)
Anim_Create(blt,"hspeed",0,0,0,0,0,25)
Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,35,24)
Anim_Create(blt,"ospd",0,0,0,-45,0,24)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_rampage_intro)
blt.idle = seq_armor_piercer_b_rampage
blt.collision_effect = seq_bullet_effect_armor_piercer_bc
blt.scale_x =- scale_x
blt.scale_y = scale_y
blt.hspeed = -17/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,-2-blt.hspeed,24)
Anim_Create(blt,"hspeed",0,0,0,0,0,25)
Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,35,24)
Anim_Create(blt,"ospd",0,0,0,-45,0,24)