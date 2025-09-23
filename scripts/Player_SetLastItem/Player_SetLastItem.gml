function Player_SetLastItem(item){
	if(Player_IsEnabled()){
		player.last_item = item;
		return true;
	}
	else{
		return false;
	}
}