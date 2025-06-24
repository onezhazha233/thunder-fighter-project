live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

rampage = false

damage_type = 1
damage_interval = 5
collision_destroy = false

collision_effect = bullet_effect_xeno

damage = 0.125

function CollideEnemy(enemy){
	if!(ds_map_exists(collision_enemy,enemy)){
		ds_map_add(collision_enemy,enemy,damage_interval);
		enemy.last_bullet = id;
		event_user(0);
		enemy.Hurt();
		a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
		a.image_xscale = scale_x*(rampage = true ? 1 : 0.6);
		a.image_yscale = scale_y*(rampage = true ? 1 : 0.6);
	}
}