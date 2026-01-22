live;
seq = layer_sequence_create(ll,x,y,seq_effect_armor_frost)
layer_sequence_xscale(seq,image_xscale)
layer_sequence_xscale(seq,image_yscale)

block = instance_create_depth(x,y,0,bullet_enemy_block)
block.mask_index = spr_effect_frost_texture
block.image_xscale = image_xscale
block.image_yscale = image_yscale