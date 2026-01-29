live;
event_inherited();
depth -= 50

display_mode = DISPLAY_MODE.SPRITE

enemy_sprite = spr_enemy_minion_10a
flame_lower = seq_enemy_minion_10a_flame

hp_max = 2
hp = 2

hpbar_enabled = false

explosion = effect_explosion_small

collision_type = COLLISION_TYPE.SPRITE

sprite_index = spr_enemy_minion_10a

items = [[[battle_item_hp_recovery],1],[[battle_item_quantum_shield],1],[[battle_item_weapon_upgrade],1],[[battle_item_rampage],1],[[],12]]

Anim_Destroy(id,"inv_damage")