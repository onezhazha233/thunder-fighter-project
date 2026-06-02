live;
global.inv_shield = 0
layer_destroy(sl)
layer_sequence_destroy(shield_sequence)
if!(instance_exists(battle_ui_victory)){
	if(battle_ui_pause_new.pause_state = 0){
		SFX_Play(snd_quantum_shield_outro);
	}
}
with(bullet_enemy){
	if(inv_block = false){
		destroy_type = 1;
		instance_destroy();
	}
}