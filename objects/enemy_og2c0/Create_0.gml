live;
event_inherited();

display_mode = ENEMY_DISPLAY_MODE.SEQUENCE

pre_mode = ENEMY_PRE_MODE.START_FRAME
idle_mode = ENEMY_IDLE_MODE.END_FRAME

pre_sequence = seq_enemy_minion_og2c0
intro_sequence = seq_enemy_minion_og2c0
idle_sequence = seq_enemy_minion_og2c0
flame_lower = seq_enemy_minion_og2c0_flame

hp_max = 60
hp = 60

hpbar_yoffset = 140

explosion = effect_explosion_big

collision_type = COLLISION_TYPE.SPRITE
sprite_index = spr_enemy_minion_og2c0_body

items = [[[battle_item_hp_recovery],1],[[battle_item_quantum_shield],1],[[battle_item_weapon_upgrade],1],[[battle_item_rampage],1],[[],12]]