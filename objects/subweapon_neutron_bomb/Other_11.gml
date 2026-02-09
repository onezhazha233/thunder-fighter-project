live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_c_explosion
blt.collision_effect_duration = 14;
blt.collision_effect_radius = 100;
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.hspeed = 34/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,2-blt.hspeed,27)
Anim_Create(blt,"hspeed",0,0,0,0,0,28)
Anim_Create(blt,"y",0,0,blt.y,35,27)
Anim_Create(blt,"vspeed",0,0,0,-22.5,0,27)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_rampage_intro)
blt.idle = seq_nuke_cd_rampage
blt.collision_effect_sequence = seq_nuke_c_explosion
blt.collision_effect_duration = 14;
blt.collision_effect_radius = 100;
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.hspeed = -34/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,-2-blt.hspeed,27)
Anim_Create(blt,"hspeed",0,0,0,0,0,28)
Anim_Create(blt,"y",0,0,blt.y,35,27)
Anim_Create(blt,"vspeed",0,0,0,-22.5,0,27)