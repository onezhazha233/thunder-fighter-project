live;
event_inherited();

display_mode = DISPLAY_MODE.SEQUENCE

pre_mode = PRE_MODE.START_FRAME
idle_mode = IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_minion_12c0_intro
intro_sequence = seq_enemy_minion_12c0_intro
idle_sequence = seq_enemy_minion_12c0_idle
flame_lower = seq_enemy_minion_12c0_flame

hp_max = 30
hp = 30

hpbar_yoffset = 120

explosion = effect_explosion_big

collision_type = COLLISION_TYPE.SPRITE
sprite_index = spr_enemy_minion_12c0_body

items = [[[battle_item_hp_recovery],1],[[battle_item_quantum_shield],1],[[battle_item_weapon_upgrade],1],[[battle_item_rampage],1],[[],12]]