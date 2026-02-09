live;
event_inherited();

up = 50
down = 50
left = 200
right = 200

pre_sequence = seq_enemy_boss_large_1_p2_intro
intro_sequence = seq_enemy_boss_large_1_p2_intro
idle_sequence = seq_enemy_boss_large_1_p2_intro
//flame_lower_pre = seq_enemy_boss_large_1_p1_flame_0
//flame_upper_pre = seq_enemy_boss_large_1_p1_flame_1
flame_lower = seq_enemy_boss_large_1_p2_flame_0
flame_upper = seq_enemy_boss_large_1_p2_flame_1

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 400
hp = hp_max

battle_ui.boss_hpbar_enabled = true;
battle_ui.boss_hpbar_phase = 0;
battle_wave.enabled = false

bullet_emitter = emitter_boss_galaxy_ash_p2

die_sequence = seq_enemy_boss_large_1_die_black

move_enabled = true
move_range = [250,250,720-250,350]
move_starttime = 0
move_nexttime = 0
move_distance = [80,180]
move_duration = [40,80]
move_interval = [10,20]
move_state = 0//0为静止 1为移动中
move_targetpos = [x,y]

items = []