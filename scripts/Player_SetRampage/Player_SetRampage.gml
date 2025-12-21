function Player_SetRampage(duration,item_effect=true){
	if(Player_IsEnabled()){
		if(Player_GetRampage() = 0){
			audio_play_sound(snd_rampage,0,0);
		}
		else{
			audio_play_sound(snd_weapon_upgrade,0,0);
		}
		player.SetRampageDuration(duration);
		if(duration > 0&&item_effect=true)instance_create_depth(player.x,player.y,-600,battle_item_effect_rampage);
		return true;
	}
	else{
		return false;
	}
}