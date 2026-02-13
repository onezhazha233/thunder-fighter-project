live;
event_inherited();

depth = DEPTH_BATTLE.ENEMIES

boss_list = []
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

die_sequence = -1

hpbar_enabled = false
boss_hpbar_enabled = true

start = 0
time = 0

name = ""

bgm = bgm_boss_mini

move_start_duration = 60

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]

active = true//销毁前一帧设置为false

move_enabled = true
move_range = [200,250,720-200,350]
move_starttime = 0
move_nexttime = 0
move_distance = [100,160]
move_duration = [80,120]
move_interval = [20,30]
move_state = 0//0为静止 1为移动中
move_targetpos = [x,y]

burn_target = 120
frozen_target = 240

global.inv_cutscene = 1
if(Player_IsEnabled())player.equipment.SetEnabled(false);