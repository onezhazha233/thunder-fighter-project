live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,500];
	move_distance = [100,250];
	move_duration = [40,60];
	move_interval = [10,20];
}

SetIdle = function(){
	if((layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og3_attack_2_intro)&&layer_sequence_get_headdir(enemy_sequence) = seqdir_right)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og3_attack_2)){
		SetSequence(seq_enemy_boss_mini_og3_attack_2_outro);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_og3_attack_2_outro)){
		SetState(ENEMY_STATE.IDLE);
	}
}