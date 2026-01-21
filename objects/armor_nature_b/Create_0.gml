live;
//nature armor
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		return exarg;
	}
	if(type = 5){
		if(random(1) < 0.6){
			heal = global.hp_max*0.001*(3+exarg);
			Player_Heal(heal,5);
		}
	}
}