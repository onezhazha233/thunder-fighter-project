live;
event_inherited();

idle = seq_armor_piercer_a

collision_type = COLLISION_TYPE.SPRITE

collision_destroy = false

collision_effect = seq_bullet_effect_armor_piercer_a

damage_type = 0

ospd = 0
time = 0

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	MakeEffect(x,y+(-30+(time mod 4)*12)*scale_y,collision_effect,scale_x,scale_y);
	time += 1;
}