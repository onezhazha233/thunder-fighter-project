live;
damage = 0.26786
switch(weapon_level){
	case 0:damage = 0.26786;break;
	case 1:damage = 0.31339;break;
	case 2:damage = 0.36429;break;
	case 3:damage = 0.375;break;
}

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_intro)
a.idle = seq_armor_piercer_b
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_bc
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_armor_piercer,seq_armor_piercer_b_intro)
a.idle = seq_armor_piercer_b
a.collision_effect_sequence = seq_bullet_effect_armor_piercer_bc
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,24)
Anim_Create(a,"hspeed",0,0,0,0,0,25)
Anim_Create(a,"y",0,0,a.y,35,24)
Anim_Create(a,"ospd",0,0,0,-22.5,0,24)