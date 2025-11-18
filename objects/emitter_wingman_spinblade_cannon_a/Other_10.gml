live;
a = instance_create_depth(x,y,depth,bullet_player_wingman_spinblade_cannon)
a.dir = dir
with(a){
	bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_spinblade_cannon_a_intro);
}
a.move_duration += 25*weapon_level
a.direction = 90
a.speed = 5.5
a.damage = damage