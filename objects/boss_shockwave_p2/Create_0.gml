live;
event_inherited();

up = 75
down = 100
left = 100
right = 100

idle_mode = ENEMY_IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_og3_p2_intro
intro_sequence = seq_enemy_boss_large_og3_p2_intro
idle_sequence = seq_enemy_boss_large_og3_p2_idle
die_sequence = seq_enemy_boss_large_og3_die
auto_idle_sequence = []

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 1500*Flag_Get(FLAG_SETTINGS,"boss_hp_ratio")
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

y_target = 400

bullet_emitter = emitter_boss_shockwave_p2

items = []
value = 1000