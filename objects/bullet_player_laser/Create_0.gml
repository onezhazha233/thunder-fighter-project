live;
event_inherited();

image_speed = 0

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_laser
collision_effect_ring = spr_buller_effect_laser_ab_ring
collision_effect_lightball = spr_buller_effect_laser_ab_lightball

time = 0

rampage = false

track_inst = noone

collision_single = true

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.ring = collision_effect_ring;
	effect.lightball = collision_effect_lightball;
	effect.scale_x = scale_x;
	effect.scale_x = scale_y;
}