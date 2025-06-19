live;
damage = 1
switch(weapon_level){
	case 0:damage = 0.5;break;
	case 1:damage = 0.325;break;
	case 2:damage = 0.284;break;
	case 3:damage = 0.25;break;
}

a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
a.sprite_index = spr_bullet_player_railcannon_a
if(dir = 0){
	a.image_angle += 17;
}
else{
	a.image_angle -= 17;
}
a.direction = a.image_angle + 90
a.speed = 45
a.damage = damage