live;
player.graze_enabled = true
//induction armor
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		return exarg;
	}
	if(type = 2){
		global.score += exarg/1.1;
	}
}