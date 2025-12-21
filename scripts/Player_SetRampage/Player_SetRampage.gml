function Player_SetRampage(duration,item_effect=true){
	if(Player_IsEnabled()){
		player.SetRampageDuration(duration);
		if(duration > 0)instance_create_depth(player.x,player.y,-600,battle_item_effect_rampage);
		return true;
	}
	else{
		return false;
	}
}