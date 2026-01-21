function Player_SetShield(duration){
	if(Player_IsEnabled()){
		layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_quantum_shield);
		if(Player_GetShield() = 0){
			shield = instance_create_depth(player.x,player.y,0,battle_quantum_shield);
			shield.duration = duration;
		}
		else if(Player_GetShield() > 0){
			battle_quantum_shield.duration = duration;
		}
		return true;
	}
	else{
		return false;
	}
}