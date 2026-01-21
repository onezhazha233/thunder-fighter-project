live;
//alloy holiness +1/2/3
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(exarg >= global.hp){
			if(global.hp >= global.hp_max*0.7){
				exarg = global.hp -1;
			}
		}
		return exarg;
	}
}