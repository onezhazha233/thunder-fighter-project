live;
event_inherited();

up = 90
down = 90
left = 150
right = 150

idle_mode = ENEMY_IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_mini_og2_intro
intro_sequence = seq_enemy_boss_mini_og2_intro
idle_sequence = seq_enemy_boss_mini_og2_idle
flame_lower = seq_enemy_boss_mini_og2_flame
die_sequence = seq_enemy_boss_mini_og2_die
auto_idle_sequence = [seq_enemy_boss_mini_og2_attack_0]

explosion = effect_explosion_boss

hp_max = 1500*Flag_Get(FLAG_SETTINGS,"boss_hp_ratio")
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

y_target = 400

bullet_emitter = emitter_boss_hellhound

items = []