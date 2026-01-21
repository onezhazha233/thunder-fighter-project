function Player_GetShield(){
	if(Player_IsEnabled()){
		dd = 0;
		for(i=0;i<instance_number(battle_quantum_shield);i+=1){//可能同时存在消失中的盾和普通盾
			ss = instance_find(battle_quantum_shield,i);
			if(ss.duration > dd){
				dd = ss.duration;
			}
		}
		return dd;
	}
	else{
		return -1;
	}
}