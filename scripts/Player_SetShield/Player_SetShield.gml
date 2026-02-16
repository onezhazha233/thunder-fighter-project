function Player_SetShield(duration){
	if(Player_IsEnabled()){
		layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_quantum_shield);
		if(instance_exists(battle_quantum_shield)){
			with(battle_quantum_shield){
				duration = duration;
				destroy_time = 0;
				fade = 0;
				fade_time = 0;
				global.inv_shield = 1;
				if(!layer_sequence_exists(sl,shield_sequence)){
					shield_sequence = layer_sequence_create(sl,x,y,seq_battle_quantum_shield);
					layer_sequence_xscale(shield_sequence,image_xscale);
					layer_sequence_yscale(shield_sequence,image_yscale);
				}
			}
		}
		else{
			shield = instance_create_depth(player.x,player.y,0,battle_quantum_shield);
			shield.duration = duration;
		}
		return true;
	}
	else{
		return false;
	}
}
