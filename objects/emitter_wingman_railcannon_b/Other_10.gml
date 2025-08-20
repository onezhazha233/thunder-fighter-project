live;
damage = 3.875
switch(weapon_level){
	case 0:damage = 3.875*global.atk_wingman;break;
	case 1:damage = 4.225*global.atk_wingman;break;
	case 2:damage = 4.4625*global.atk_wingman;break;
	case 3:damage = 3.875*global.atk_wingman;break;
}

a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
a.sprite_index = spr_bullet_player_railcannon_b
a.collision_effect_sequence = seq_bullet_effect_railcannon_b;
if(dir = 0){
	a.image_angle += 17;
}
else{
	a.image_angle -= 17;
}
a.direction = a.image_angle + 90
a.speed = 45
a.damage = damage