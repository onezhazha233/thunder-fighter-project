live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_large_15_base

idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_15_p2_intro
intro_sequence = seq_enemy_boss_large_15_p2_intro
idle_sequence = seq_enemy_boss_large_15_p2_idle
flame_lower = seq_enemy_boss_large_15_p2_flame

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 1000
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_dark_assault_p2

die_sequence = seq_enemy_boss_large_15_die

items = []