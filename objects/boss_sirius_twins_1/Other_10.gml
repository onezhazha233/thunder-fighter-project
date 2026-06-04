live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,500];
	move_distance = [150,300];
	move_duration = [40,60];
	move_interval = [20,30];
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover_attack)){
		SetSequence(seq_enemy_boss_mini_0_cover);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_cover)){
		SetState(ENEMY_STATE.IDLE);
	}
}

TakeDamage = function(dmg){
	with(boss_sirius_twins_0)TakeDamage(dmg);
}