live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_dawn
collision_effect_sequence = seq_bullet_effect_dawn_a

image_speed = 0
image_xscale = 0.7
image_yscale = 0.3
image_alpha = 0.5

collision_single = true

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x*1.5;
	effect.image_yscale = scale_y*1.5;
}