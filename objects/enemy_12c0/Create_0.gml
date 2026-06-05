live;
event_inherited();

display_mode = ENEMY_DISPLAY_MODE.SEQUENCE

pre_mode = ENEMY_PRE_MODE.START_FRAME
idle_mode = ENEMY_IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_minion_12c0_intro
intro_sequence = seq_enemy_minion_12c0_intro
idle_sequence = seq_enemy_minion_12c0_idle
flame_lower = seq_enemy_minion_12c0_flame

hp_max = 60
hp = 60

hpbar_yoffset = 120

explosion = effect_explosion_big

collision_type = COLLISION_TYPE.SPRITE
sprite_index = spr_enemy_minion_12c0_body

items = [[[battle_item_hp_recovery],1],[[battle_item_quantum_shield],1],[[battle_item_weapon_upgrade],1],[[battle_item_rampage],1],[[],12]]