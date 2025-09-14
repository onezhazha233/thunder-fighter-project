live;
//alloy barrier
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(random(1) <= 0.3){
			exarg = exarg/2;
		}
	}
	return exarg;
}