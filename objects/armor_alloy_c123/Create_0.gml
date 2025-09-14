live;
//alloy bastion +1/2/3
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(random(1) <= 0.25){
			exarg = exarg/2;
		}
	}
	return exarg;
}