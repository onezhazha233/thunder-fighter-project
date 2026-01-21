live;
//dragon shield
ArmorAbility = function(type,exarg=0){
	if(type = 0){
		global.hp = min(global.hp_max,global.hp + global.hp_max*0.0025/60);
	}
	if(type = 1){
		return exarg;
	}
}