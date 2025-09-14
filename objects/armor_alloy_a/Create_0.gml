live;
//alloy shield
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(random(1) <= 0.1){
			exarg = exarg/2;
		}
	}
	return exarg;
}