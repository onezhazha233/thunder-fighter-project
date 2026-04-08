live;
event_inherited();

depth = DEPTH_BATTLE.BULLETS_ENEMY;

collision_type = COLLISION_TYPE.RECTANGLE
collision_destroy = true
up = 10
down = 10
left = 10
right = 10
alarm[0] = 1

hpbar_enabled = false;

Anim_Destroy(id,"inv_damage")
inv_damage = false;
hp_max = 3;
hp = hp_max;

damage = 1;

rotate = 0

mark = noone

destroy_type = 0//0为被守卫抵挡 1为被护盾消除 2为碰到玩家判定点 3为无特效直接消失 4为被调试清屏或boss切换阶段等强制销毁 5为被打掉
destroy_effect = noone
inv_block = false//是否免疫守卫护盾等清除效果，适用于激光器等

duration = -1
auto_destroy = true
auto_destroy_delay = 60

scale_x = 1
scale_y = 1