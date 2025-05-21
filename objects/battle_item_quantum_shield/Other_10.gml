live;
layer_sequence_create("item_effects",x,y,seq_battle_item_effect_quantum_shield);
if(instance_exists(battle_quantum_shield)){
	if(battle_quantum_shield.duration > 0){
		battle_quantum_shield.duration = global.quantum_shield_duration;
	}
	else{
		instance_destroy(battle_quantum_shield);
		instance_create_depth(player.x,player.y,0,battle_quantum_shield);
	}
}
else{
	instance_create_depth(player.x,player.y,0,battle_quantum_shield);
}