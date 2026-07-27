live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_large_og2_bottom_0

idle_mode = ENEMY_IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_og2_p2_intro
intro_sequence = seq_enemy_boss_large_og2_p2_intro
idle_sequence = seq_enemy_boss_large_og2_p2_idle

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 2000*Flag_Get(FLAG_SETTINGS,"boss_hp_ratio")
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_sirius_twins_1

items = []
value = 1000