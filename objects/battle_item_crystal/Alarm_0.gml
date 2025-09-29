live;
enabled = true
item_sequence = layer_sequence_create(global.layer_items_crystal,x,y,asset_get_index("seq_battle_item_crystal_"+string(type)))
//item_sequence = layer_sequence_create(global.layer_items_crystal,x,y,seq_battle_item_crystal_2)

if(gravity_enabled = true)gravity = 0.5;