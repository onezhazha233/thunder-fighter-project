live;
event_inherited();

display_mode = DISPLAY_MODE.SPRITE

enemy_sprite = spr_enemy_minion_4b

/*pre_mode = 0
idle_mode = 0
pre_sequence = seq_enemy_boss_mini_3_intro
intro_sequence = seq_enemy_boss_mini_3_intro
idle_sequence = seq_enemy_boss_mini_3_intro*/
flame_lower = seq_enemy_minion_4b_flame

hp_max = 30
hp = 30

hpbar_yoffset = 80

explosion = effect_explosion_medium

collision_type = 1
sprite_index = spr_enemy_minion_4b
left = 85
right = 85
up = 63
down = 60

bullet_emitter = emitter_enemy_b

time = 0
aa = 0
num = 4
as = 4

mover = function(){EnemyMove_0b()}