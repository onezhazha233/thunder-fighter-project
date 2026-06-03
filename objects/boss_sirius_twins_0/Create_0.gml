live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_mini_og1_0_bottom_0

idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_mini_og1_0_intro
intro_sequence = seq_enemy_boss_mini_og1_0_intro
idle_sequence = seq_enemy_boss_mini_og1_0_idle
die_sequence = seq_enemy_boss_mini_0_die
auto_idle_sequence = [seq_enemy_boss_mini_0_cover]

explosion = effect_explosion_boss

hp_max = 2500*Flag_Get(FLAG_SETTINGS,"boss_hp_ratio")
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360-150
y = -500

x_target = x
y_target = 500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_red_heavy

items = []
