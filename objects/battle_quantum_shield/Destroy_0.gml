live;
if!(instance_exists(battle_ui_victory)){
	if(battle_ui_pause.pause_state = 0){
		SFX_Play(snd_quantum_shield_outro);
	}
}