live;
event_inherited();

bg_sequence = layer_sequence_create("item",x,y,seq_battle_item_ring)
item_sequence = layer_sequence_create("item",x,y,seq_battle_item_rampage)

direction = random(360)
speed = 6