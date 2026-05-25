live;
event_inherited();

up = 150
down = 150
left = 360
right = 360

idle_mode = IDLE_MODE.END_FRAME

pre_sequence = seq_enemy_boss_large_og1_p2_intro
intro_sequence = seq_enemy_boss_large_og1_p2_intro
idle_sequence = seq_enemy_boss_large_og1_p2_intro
flame_lower = seq_enemy_boss_large_og1_p2_flame

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 2000*global.boss_hp_ratio
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

y_target = 250

battle_ui.boss_hpbar_enabled = true
battle_wave.enabled = false

bullet_emitter = emitter_boss_laser_piano_p2

items = []
