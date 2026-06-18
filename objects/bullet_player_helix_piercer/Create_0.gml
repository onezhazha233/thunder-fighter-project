live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_destroy = false
auto_destroy = false

collision_effect = seq_bullet_effect_helix_piercer

damage_type = 1

image_speed = 0

function CollideSingleEnemy(enemy){
	if!(ds_map_exists(collision_enemy,enemy)){
		ds_map_add(collision_enemy,enemy,damage_interval);
		enemy.last_bullet = id;
		event_user(0);
		enemy.Hurt();
		layer_sequence_angle(MakeEffect(x,y,collision_effect,scale_x,scale_y),image_angle-90);
	}
}

time = 0
rampage = false

ox = x
oy = y
xscale = 0.2
yscale = 0.2
big = 0
rotspd = 9
dist = 30
dist_max = 114514
alarm[1] = 1
part_add = 0