live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_player_lightning_explosion
collision_effect_sequence = seq_bullet_effect_lightning_a

track_inst = noone

acceleration = 0

speed = 5

rampage = false

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

function CollideSingleEnemy(enemy){
	instance_destroy();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
	effect.damage = damage;
}