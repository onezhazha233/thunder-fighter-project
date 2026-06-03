live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,350];
	move_distance = [150,250];
	move_duration = [80,120];
	move_interval = [20,30];
}

OnDie = function(){
	Player_AddScore(500);
	MakeBossCrystal(x,y,500);
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover_attack)){
		SetSequence(seq_enemy_boss_mini_0_cover);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_cover)){
		SetState(ENEMY_STATE.IDLE);
	}
}