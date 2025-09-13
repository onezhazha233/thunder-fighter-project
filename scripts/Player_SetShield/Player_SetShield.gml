function Player_SetShield(duration){
	if(instance_exists(player)&&instance_exists(player.equipment)){
		layer_sequence_create(global.layer_item_effects,x,y,seq_battle_item_effect_quantum_shield);
		if!(Player_GetShield() = 0){
			for(i=0;i<instance_number(battle_quantum_shield);i+=1){
				shield = instance_find(battle_quantum_shield,i);
				if(shield.duration > 0){
					shield.duration = duration;
					break;
				}
			}
		}
		else{
			instance_create_depth(player.x,player.y,0,battle_quantum_shield);
		}
		return true;
	}
	else{
		return false;
	}
}