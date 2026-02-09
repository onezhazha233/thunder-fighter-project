live;
blt = instance_create_depth(x,y,depth,bullet_player_wingman_spinblade_cannon)
blt.idle = seq_bullet_player_spinblade_cannon_b
blt.edge_intro = seq_bullet_player_spinblade_cannon_b_edge_intro
blt.edge = seq_bullet_player_spinblade_cannon_b_edge
blt.dir = dir
with(blt){
	bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_spinblade_cannon_b_intro);
}
blt.move_duration += 25*weapon_level
blt.direction = 90
blt.speed = 5.5
blt.damage = damage