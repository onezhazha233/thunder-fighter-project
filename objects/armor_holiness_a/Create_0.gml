live;
//holiness shield
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(exarg >= global.hp){
			if(global.hp >= global.hp_max){
				exarg = global.hp -1;
			}
		}
	}
	return exarg;
}