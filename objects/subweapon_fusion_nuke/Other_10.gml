live;
damage = 0.75/2
switch(weapon_level){
	case 0:damage = 0.75/2;break;
	case 1:damage = 0.8125/2;break;
	case 2:damage = 0.85/2;break;
	case 3:damage = 0.75/2;break;
}

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_intro)
a.idle = seq_nuke_cd
a.collision_effect_sequence = seq_nuke_d_explosion
a.collision_effect_duration = 20;
a.collision_effect_radius = 110;
a.hspeed = 8
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",0,0,a.y,35,27)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,27)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_intro)
a.idle = seq_nuke_cd
a.collision_effect_sequence = seq_nuke_d_explosion
a.collision_effect_duration = 20;
a.collision_effect_radius = 110;
a.hspeed = -8
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,27)
Anim_Create(a,"hspeed",0,0,0,0,0,28)
Anim_Create(a,"y",0,0,a.y,35,27)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,27)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_intro)
a.idle = seq_nuke_cd
a.collision_effect_sequence = seq_nuke_d_explosion
a.collision_effect_duration = 20;
a.collision_effect_radius = 110;
a.hspeed = 12.0625
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,32)
Anim_Create(a,"hspeed",0,0,0,0,0,33)
Anim_Create(a,"y",0,0,a.y,35,32)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,32)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_nuke,seq_nuke_cd_intro)
a.idle = seq_nuke_cd
a.collision_effect_sequence = seq_nuke_d_explosion
a.collision_effect_duration = 20;
a.collision_effect_radius = 110;
a.hspeed = -12.0625
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,32)
Anim_Create(a,"hspeed",0,0,0,0,0,33)
Anim_Create(a,"y",0,0,a.y,35,32)
Anim_Create(a,"vspeed",0,0,0,-22.5,0,32)