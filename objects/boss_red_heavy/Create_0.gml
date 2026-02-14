live;
event_inherited();

up = 50
down = 50
left = 150
right = 150

pre_sequence = seq_enemy_boss_mini_0_intro
intro_sequence = seq_enemy_boss_mini_0_intro
idle_sequence = seq_enemy_boss_mini_0_intro
flame_lower = seq_enemy_boss_mini_0_flame
die_sequence = seq_enemy_boss_mini_0_die

explosion = effect_explosion_boss

hp_max = 300
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_red_heavy

move_enabled = true
move_range = [150,250,720-150,350]
move_starttime = 0
move_nexttime = 0
move_distance = [150,250]
move_duration = [80,120]
move_interval = [20,30]
move_state = 0//0为静止 1为移动中
move_targetpos = [x,y]

items = []
