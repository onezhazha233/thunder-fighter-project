live;
damage = 1.1365
switch(weapon_level){
	case 0:damage = 1.1365*global.atk_wingman;break;
	case 1:damage = 1.2926*global.atk_wingman;break;
	case 2:damage = 1.4489*global.atk_wingman;break;
	case 3:damage = 1.4205*global.atk_wingman;break;
}

a = instance_create_depth(x,y,depth,bullet_player_wingman_spinblade_cannon)
a.idle = seq_bullet_player_spinblade_cannon_b
a.edge_intro = seq_bullet_player_spinblade_cannon_b_edge_intro
a.edge = seq_bullet_player_spinblade_cannon_b_edge
a.dir = dir
with(a){
	bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_spinblade_cannon_b_intro);
}
a.move_duration += 25*weapon_level
a.direction = 90
a.speed = 5.5
a.damage = damage