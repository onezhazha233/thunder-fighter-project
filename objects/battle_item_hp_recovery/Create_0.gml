live;
event_inherited();

bg_sequence = layer_sequence_create(global.layer_items,x,y,seq_battle_item_ring)
item_sequence = layer_sequence_create(global.layer_items,x,y,seq_battle_item_hp_recovery)

direction = random(360)
speed = random_range(3,6)