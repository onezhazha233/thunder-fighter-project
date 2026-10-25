live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_player_lightning_explosion
collision_effect_sequence = seq_lightning_a_explosion

track_inst = noone

speed = 0

rampage = false

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

function CollideSingleEnemy(enemy){
	instance_destroy();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
	effect.damage = damage;
}

/* —— 原版 FollowBehavior 贝塞尔追踪(逆自重制版明文JS) ——
   发射: P0=发射点, P1=P0+100u, P2=P0+300u (u=发射方向单位向量), 初始终点=P0+1100u
   每帧: 终点改写为锁定目标当前位置(控制点不变); t += track_perm(‰/帧)
   位置 = 三次贝塞尔(P0,P1,P2,终点)(t); 朝向=切线方向
   t>=1 → 直线飞行(speed=init_v, 方向=末切线) */
track_perm = 0.015
init_v = 20
b_t = 0
bezier_done = false
standby = 0

InitBezier = function(){
	p0x = x;
	p0y = y;
	p1x = x + lengthdir_x(100, direction);
	p1y = y + lengthdir_y(100, direction);
	p2x = x + lengthdir_x(300, direction);
	p2y = y + lengthdir_y(300, direction);
	if(!instance_exists(track_inst)){
		target_x = x + lengthdir_x(1100, direction);
		target_y = y + lengthdir_y(1100, direction);
	}
	b_t = 0;
	bezier_done = false;
}
