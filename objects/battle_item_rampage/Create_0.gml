live;
event_inherited();

ll = layer_create(depth)
ll_fx = layer_create(depth - 1)

bg_sequence = layer_sequence_create(ll,x,y,seq_battle_item_ring)
item_sequence = layer_sequence_create(ll,x,y,seq_battle_item_rampage)
effect_sequence = -1

direction = random(360)
speed = random_range(3,6)

duration = -1//临时道具为510

SetDuration = function(d){
	duration = d;
	effect_sequence = layer_sequence_create(ll_fx,x,y,seq_battle_item_temp_effect);
}