live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,500];
	move_distance = [250,300];
	move_duration = [30,50];
	move_interval = [10,20];
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover_attack)){
		SetSequence(seq_enemy_boss_mini_0_cover);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_cover)){
		SetState(ENEMY_STATE.IDLE);
	}
}