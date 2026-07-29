live;
event_inherited();

SetMoveInfo = function(){
	move_range = [200,250,720-200,350];
	move_distance = [100,160];
	move_duration = [80,120];
	move_interval = [20,30];
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_large_og2_p1_attack_0)){
		if(layer_sequence_get_headdir(enemy_sequence) = seqdir_right){
			SetSequence(seq_enemy_boss_large_og2_p1_attack_0,seqdir_left);
		}
		else{
			SetState(ENEMY_STATE.IDLE);
		}
	}
	else if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_large_og2_p1_attack_1_intro)){
		SetSequence(seq_enemy_boss_large_og2_p1_attack_1_outro);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_large_og2_p1_attack_1_outro)){
		SetState(ENEMY_STATE.IDLE);
	}
}