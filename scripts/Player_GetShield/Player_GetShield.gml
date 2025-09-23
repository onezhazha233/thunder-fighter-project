function Player_GetShield(){
	if(Player_IsEnabled()){
		sd = 0;
		for(i=0;i<instance_number(battle_quantum_shield);i+=1){
			shield = instance_find(battle_quantum_shield,i);
			if(shield.duration > 0){
				sd = shield.duration
				break;
			}
		}
		return sd;
	}
	else{
		return -1;
	}
}