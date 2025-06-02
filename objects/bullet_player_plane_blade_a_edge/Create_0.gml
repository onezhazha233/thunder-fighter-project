live;
dd = 0
dir = random_range(-30,30)

attack = function(){
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create("bullets_player",x,y,seq_bullet_player_blade_a_edge_attack);
	alarm[1] = 45;
	emitter_plane_blade_a.edge_cd = 45;
	a = instance_create_depth(emitter_plane_blade_a.laser[0].find[1].x,emitter_plane_blade_a.laser[0].find[1].y,0,bullet_player_plane_blade_a_slash);
	a.image_angle = dir;
	alarm[2] = 4;
	instance_create_depth(emitter_plane_blade_a.laser[0].find[1].x,emitter_plane_blade_a.laser[0].find[1].y,0,bullet_effect_blade_slash_ring);
}