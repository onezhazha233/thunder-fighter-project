live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

rampage = false

collision_effect = bullet_player_raptor_explosion

damage = 0.25

function CollideEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	instance_destroy();
	effect = instance_create_depth(x+lengthdir_x(10*scale_x,image_angle+90),y+lengthdir_y(10*scale_y,image_angle+90),DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.image_xscale = scale_x*(rampage = true ? 1 : 0.6);
	effect.image_yscale = scale_y*(rampage = true ? 1 : 0.6);
	effect.damage = damage;
	with(effect)ds_map_add(collision_enemy,enemy,damage_interval);
}