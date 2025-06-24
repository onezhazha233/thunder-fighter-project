live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_dawn
collision_effect_sequence = seq_bullet_effect_dawn_a

image_speed = 0
image_xscale = 0.7
image_yscale = 0.3
image_alpha = 0.5

function CollideEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	instance_destroy();
	a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	a.sequence = collision_effect_sequence;
	a.image_xscale = scale_x*1.5;
	a.image_yscale = scale_y*1.5;
}