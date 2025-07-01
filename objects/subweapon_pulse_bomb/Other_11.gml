live;
damage = 0.75

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_a_rampage_intro)
a.idle = seq_nuke_a_rampage
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 34/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",0,0,a.y,35,27)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,27)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_a_rampage_intro)
a.idle = seq_nuke_a_rampage
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -34/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",0,0,a.y,35,27)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,27)