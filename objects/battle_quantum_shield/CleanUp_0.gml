live;
global.inv_shield = 0
layer_destroy(sl)
layer_sequence_destroy(shield_sequence)
audio_play_sound(snd_quantum_shield_outro,0,0)
with(bullet_enemy){
	if(inv_block = true){
		destroy_type = 1;
		instance_destroy();
	}
}