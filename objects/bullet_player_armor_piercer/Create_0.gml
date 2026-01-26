live;
event_inherited();

idle = seq_armor_piercer_a

collision_type = COLLISION_TYPE.SPRITE

//seq_bullet_effect_dawn_b //seq_bullet_effect_armor_piercer_a
ef = seq_bullet_effect_armor_piercer_a

collision_destroy = false
damage_type = 0
collision_single = false

ospd = 0
time = random(5)

/*function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.ring = collision_effect_ring;
	effect.lightball = collision_effect_lightball;
	effect.scale_x = scale_x;
	effect.scale_x = scale_y;
	show_message(collision_effect)
}*/
/*function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	if(time >= 10){
		effect = instance_create_depth(x,y+(-30+(time mod 5)*12)*scale_y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
		effect.sequence = collision_effect_sequence;
		effect.image_xscale = scale_x;
		effect.image_yscale = scale_y;
		time = 0;
	}
	time += 0.5;
}