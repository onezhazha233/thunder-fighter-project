collision_type = COLLISION_TYPE.RECTANGLE
up = 10
down = 10
left = 10
right = 10
sequence = -1
bullet_sequence = -1
collision_destroy = true
auto_destroy = true
auto_destroy_delay = 60
destroy_effect = noone
damage = 1

scale_x = 1
scale_y = 1

alarm[0] = 1

function OnCollision(enemy){
	if(enemy.inv_damage = false)event_user(0);
	if(collision_destroy = true){
		instance_destroy();
	}
}