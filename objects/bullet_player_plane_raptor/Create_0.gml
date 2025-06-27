live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

rampage = false

collision_effect = bullet_player_raptor_explosion

damage = 0.25

function CollideSingleEnemy(enemy){
	instance_destroy();
	effect = instance_create_depth(x+lengthdir_x(10*scale_x,image_angle+90),y+lengthdir_y(10*scale_y,image_angle+90),DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.image_xscale = scale_x*(rampage = true ? 2 : 1.5);
	effect.image_yscale = scale_y*(rampage = true ? 2 : 1.5);
	effect.damage = damage;
}