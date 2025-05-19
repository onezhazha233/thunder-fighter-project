live;
if(instance_exists(battle_quantum_shield)){
	battle_quantum_shield.duration = global.quantum_shield_duration;
}
else{
	instance_create_depth(player.x,player.y,0,battle_quantum_shield);
}