live;
event_inherited();

up = 30
down = 20
left = 40
right = 40

image_xscale = 3.61
image_yscale = 2.89
vspeed = -45

damage = 2
damage_type = 1
damage_interval = 999
collision_destroy = false

collision_effect = bullet_effect_apex

function CollideEnemy(enemy){
	if!(ds_map_exists(collision_enemy,enemy)){
		ds_map_add(collision_enemy,enemy,damage_interval);
		enemy.last_bullet = id;
		event_user(0);
		enemy.Hurt();
		effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
		effect.image_xscale = scale_x*1.5;
		effect.image_yscale = scale_y*1.5;
	}
}