live;
event_inherited();

up = 50
down = 50
left = 200
right = 200

pre_sequence = seq_enemy_boss_large_1_p1_intro
intro_sequence = seq_enemy_boss_large_1_p1_intro
idle_sequence = seq_enemy_boss_large_1_p1_intro
flame_lower_pre = seq_enemy_boss_large_1_p1_pre_flame_0
flame_upper_pre = seq_enemy_boss_large_1_p1_pre_flame_1
flame_lower = seq_enemy_boss_large_1_p1_flame_0
flame_upper = seq_enemy_boss_large_1_p1_flame_1

explosion = effect_explosion_boss

hp_max = 500
hp = hp_max

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_ui.boss_hpbar_phase = 1
battle_wave.enabled = false

bullet_emitter = emitter_boss_test_0

move_enabled = true
move_range = [200,250,720-200,350]
move_starttime = 0
move_nexttime = 0
move_distance = [100,160]
move_duration = [80,120]
move_interval = [20,30]
move_state = 0//0为静止 1为移动中
move_targetpos = [x,y]

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]