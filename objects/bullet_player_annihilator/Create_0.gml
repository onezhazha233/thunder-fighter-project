live;
event_inherited();

image_speed = 0
tail_scale = 0
tail_image = 1

Anim_Create(id,"tail_scale",0,0,0,2.5,15,15)

collision_type = COLLISION_TYPE.SPRITE
collision_effect_sequence = seq_bullet_effect_dawn_c

track_inst = noone
track_inst_exists = 1

rampage = false

damage = 1

target_x = player.x;
target_y = player.y-800;

target_x_previous = target_x
target_y_previous = target_y

pass_target = 0

baseDirSpd = 0.01;
dirSpd = baseDirSpd;

bestDis = 100;

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_dawn);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
}