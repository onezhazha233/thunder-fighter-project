function Player_SetRampage(duration,text_effect=true){
	if(Player_IsEnabled()){
		if(duration > 0){
			if(Player_GetRampage() = 0){
				audio_play_sound(snd_rampage_0,0,0);
				audio_play_sound(snd_rampage_1,0,0);
			}
			else{
				audio_play_sound(snd_weapon_upgrade,0,0);
			}
		}
		player.SetRampageDuration(duration);
		if(duration > 0){
			player.equipment.armor_inst.ArmorAbility(3);
			if(text_effect=true){
				instance_create_depth(player.x,player.y,-600,battle_item_effect_rampage);
			}
		}
		return true;
	}
	else{
		return false;
	}
}