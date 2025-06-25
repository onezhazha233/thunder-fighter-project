live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_shotcannon

image_xscale = 0.4
image_yscale = 1.5
vspeed = -66

damage = 1

function CollideEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.image_xscale = scale_x*1.5;
	effect.image_yscale = scale_y*1.5;
}