function Player_GetLastItem(item){
	if(Player_IsEnabled()){
		return player.last_item;
	}
	else{
		return noone;
	}
}