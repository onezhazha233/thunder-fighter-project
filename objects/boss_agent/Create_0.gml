live;
event_inherited();

depth = DEPTH_BATTLE.ENEMIES

next_boss = -1
phase = 0

Anim_Destroy(id,"inv_damage")
inv_damage = false
inv_collision = true

skip = false//为0时为第一阶段，否则创建即变形

x_target = 360//出场时目标x位置
y_target = 300//出场时目标y位置

display_mode = 1

flame_lower_pre = -1
flame_upper_pre = -1

hpbar_enabled = false

start = 0
time = 0

name = ""

move_start_duration = 60

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]