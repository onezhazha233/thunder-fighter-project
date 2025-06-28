live;
event_inherited();

idle = seq_armor_piercer_a

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_armor_piercer
collision_effect_sequence = seq_bullet_effect_armor_piercer_a

collision_destroy = false
damage_type = 0

ospd = 0
time = random(5)

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y+(-30+(time mod 5)*12)*scale_y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
	time += 0.5;
}