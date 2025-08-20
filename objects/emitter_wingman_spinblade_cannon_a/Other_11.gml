live;
damage = 2.2727*global.atk_wingman

a = instance_create_depth(x,y,depth,bullet_player_wingman_spinblade_cannon)
a.dir = dir
a.scale_x = 1.5
a.scale_y = 1.5
with(a){
	bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_spinblade_cannon_a_intro);
}
a.move_duration -= 25
a.direction = 90
a.speed = 12
a.damage = damage