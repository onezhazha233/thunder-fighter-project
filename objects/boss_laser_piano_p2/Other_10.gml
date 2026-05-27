live;
event_inherited();

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_large_og1_p2_attack_intro)){
		SetSequence(seq_enemy_boss_large_og1_p2_attack_outro);
	}
	else{
		SetState(ENEMY_STATE.IDLE);
	}
}