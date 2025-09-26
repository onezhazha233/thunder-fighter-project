live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

damage = 1
explosion_damage = 1
explosion_effect = bullet_player_cluster_bomb_explosion
explosion_effect_sequence = seq_bullet_effect_missile_a
explosion_effect_radius = 40
explosion_effect_scale = 1

image_speed = 0

time = 0

following = 0
follow_enemy = noone
follow_enemy_xo = 0
follow_enemy_yo = 0

delay = 90

collision_destroy = false

flame = spr_sticky_bomb_ab_flame
flame_scale = 0

rampage = false

alarm[2] = 1

function CollideSingleEnemy(enemy){
	if(follow_enemy = noone){
		following = 1;
		speed = 0;
		follow_enemy = enemy;
		follow_enemy_xo = x - enemy.x;
		follow_enemy_yo = y - enemy.y;
		Anim_Destroy(id,"image_angle");
		Anim_Destroy(id,"direction");
		Anim_Destroy(id,"speed");
		Anim_Destroy(id,"flame_scale");
		Anim_Create(id,"flame_scale",0,0,1,-1,10);
		Anim_Destroy(id,"x");
		Anim_Destroy(id,"y");
		Anim_Create(id,"follow_enemy_xo",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,follow_enemy_xo,lengthdir_x(10,direction),10);
		Anim_Create(id,"follow_enemy_yo",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,follow_enemy_yo,lengthdir_y(10,direction),10);
		alarm[1] = delay;
	}
}

function HurtEnemy(){
	if(enemy.inv_damage = false)enemy.hp -= damage;
}