live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_large_og0_base

idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_og0_p1_intro
intro_sequence = seq_enemy_boss_large_og0_p1_intro
idle_sequence = seq_enemy_boss_large_og0_p1_idle
flame_lower = seq_enemy_boss_large_og0_p1_flame

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 1000*global.boss_hp_ratio
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_umbra_apex_p1

intro_move_started = false
intro_move_done = false
intro_move_timer = 0

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]
