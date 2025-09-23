function Player_SetRampage(duration,item_effect=true){
	if(Player_IsEnabled()){
		player.SetRampageDuration(duration);
		if(item_effect = true){
			layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_rampage);
		}
		return true;
	}
	else{
		return false;
	}
}