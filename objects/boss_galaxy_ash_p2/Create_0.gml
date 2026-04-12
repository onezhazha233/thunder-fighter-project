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

hp_max = 1000
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

battle_ui.boss_hpbar_enabled = true;
battle_wave.enabled = false

bullet_emitter = emitter_boss_galaxy_ash_p2_new

die_sequence = seq_enemy_boss_large_1_die_black

items = []
