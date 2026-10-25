live;
event_inherited();

image_speed = 0
tail_scale = 0
tail_image = 1
scale_add = 0

Anim_Create(id,"tail_scale",0,0,0,2.5,15,15)

collision_type = COLLISION_TYPE.SPRITE
collision_effect = seq_bullet_effect_dawn_c

track_inst = noone

rampage = false

damage = 1

/* —— 原版 FollowBehavior 贝塞尔追踪(同闪电弹) —— */
track_perm = 0.03
init_v = 30
b_t = 0
bezier_done = false
standby = 5          /* 原版歼灭炮弹 params[5]=5: 发射前在僚机处悬停5帧 */

/* 原版 FIXED_POS: 无敌机时飞向玩家上方1000px的固定点 */
if(instance_exists(player)){
	target_x = player.x;
	target_y = player.y - 1000;
}
else{
	target_x = equipment_agent.x;
	target_y = equipment_agent.y - 1000;
}

InitBezier = function(){
	p0x = x;
	p0y = y;
	p1x = x + lengthdir_x(100, direction);
	p1y = y + lengthdir_y(100, direction);
	p2x = x + lengthdir_x(300, direction);
	p2y = y + lengthdir_y(300, direction);
	b_t = 0;
	bezier_done = false;
}
