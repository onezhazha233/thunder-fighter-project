live;
event_inherited();

idle = seq_nuke_a

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_player_nuke_explosion
collision_effect_sequence = seq_nuke_a_explosion
collision_effect_duration = 10
collision_effect_radius = 80

duration = 70

dir = 0

function CollideSingleEnemy(enemy){
	instance_destroy();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.duration = collision_effect_duration;
	effect.radius = collision_effect_radius;
	effect.image_xscale = image_xscale;
	effect.image_yscale = image_yscale;
	effect.dir = dir;
	effect.damage = damage;
}