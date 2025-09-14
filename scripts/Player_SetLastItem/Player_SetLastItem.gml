function Player_SetLastItem(item){
	if(instance_exists(player)){
		player.last_item = item;
		return true;
	}
	else{
		return false;
	}
}