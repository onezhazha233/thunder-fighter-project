live;
//holiness armor
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(exarg >= global.hp){
			if(global.hp >= global.hp_max*0.9){
				exarg = global.hp -1;
			}
		}
	}
	return exarg;
}