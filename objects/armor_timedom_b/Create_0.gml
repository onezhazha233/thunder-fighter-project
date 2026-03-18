live;
//timedom armor
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		return exarg;
	}
	if(type = 4){
		if(exarg[1] = false){
			if(random(1) < 0.15){
				MakeItem(player.x,player.y,exarg[0],true,510);
			}
		}
	}
}