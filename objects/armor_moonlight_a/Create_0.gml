live;
//moonlight shield
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		return exarg;
	}
	if(type = 3){
		if(random(1) < 0.1){
			Player_SetShield(global.quantum_shield_duration);
		}
	}
}