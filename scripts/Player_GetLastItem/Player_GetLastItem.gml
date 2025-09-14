function Player_GetLastItem(item){
	if(instance_exists(player)){
		return player.last_item;
	}
	else{
		return noone;
	}
}