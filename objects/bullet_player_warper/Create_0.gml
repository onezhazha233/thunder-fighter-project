live;
event_inherited();

image_speed = 0
image_alpha = 0.5
cover_alpha = 0
cover_alpha_factor = 1
Anim_Create(id,"cover_alpha",0,0,0,0.5,15)
Anim_Create(id,"cover_alpha",0,0,0,0,0,16)
Anim_Create(id,"cover_alpha",0,0,0.5,-0.5,15,24)
Anim_Create(id,"cover_alpha",0,0,0.5,-0.5,15,24)
Anim_Create(id,"image_alpha",0,0,0.5,0.5,15,40)

collision_type = COLLISION_TYPE.SPRITE

collision_effect_sequence = seq_bullet_effect_dawn_a

bounce = 0
time = 0

rampage = false

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_dawn);
	effect.sequence = collision_effect_sequence;
	effect.scale_x = scale_x;
	effect.scale_x = scale_y;
}