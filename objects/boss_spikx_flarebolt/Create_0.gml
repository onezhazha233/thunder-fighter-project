live;
event_inherited();

up = 60
down = 100
left = 120
right = 120

pre_mode = PRE_MODE.SEQUENCE
idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_mini_og0_pre
intro_sequence = seq_enemy_boss_mini_og0_intro
idle_sequence = seq_enemy_boss_mini_og0_idle
flame_lower = seq_enemy_boss_mini_og0_flame
die_sequence = seq_enemy_boss_mini_0_die
auto_idle_sequence = [seq_enemy_boss_mini_0_cover]

explosion = effect_explosion_boss

hp_max = 800
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_red_heavy_new

items = []
