live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_large_15_base

idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_15_p1_intro
intro_sequence = seq_enemy_boss_large_15_p1_intro
idle_sequence = seq_enemy_boss_large_15_p1_idle
flame_lower = seq_enemy_boss_large_15_p1_flame

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 500
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_dark_assault_p1

intro_move_started = false
intro_move_done = false
intro_move_timer = 0

move_enabled = true
move_range = [150,150,570,1000]
move_starttime = 0
move_nexttime = 0
move_distance = [200,600]
move_duration = [20,30]
move_interval = [0,5]
move_state = 0//0为静止 1为移动中
move_targetpos = [x,y]

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]
