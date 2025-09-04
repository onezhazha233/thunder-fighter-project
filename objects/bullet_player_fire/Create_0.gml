live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

rotate = 0
image_speed = 0
image_index = random(image_number)

function CollideSingleEnemy(enemy){
	if(image_alpha > 0.3){
		if!(ds_map_exists(collision_enemy,enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			enemy.last_bullet = id;
			event_user(0);
			enemy.Hurt();
		}
	}
}