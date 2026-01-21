live;
//dragon bastion +1/2/3
ArmorAbility = function(type,exarg=0){
	if(type = 0){
		global.hp = min(global.hp_max,global.hp + global.hp_max*0.007/60);
	}
	if(type = 1){
		return exarg;
	}
}