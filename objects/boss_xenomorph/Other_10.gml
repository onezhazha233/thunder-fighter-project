live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,500];
	move_distance = [150,250];
	move_duration = [60,100];
	move_interval = [10,25];
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og0_attack_1)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og0_attack_1_intro)){
		SetSequence(seq_enemy_boss_mini_og0_attack_1_outro);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og0_attack_1_outro)){
		SetState(ENEMY_STATE.IDLE);
	}
}