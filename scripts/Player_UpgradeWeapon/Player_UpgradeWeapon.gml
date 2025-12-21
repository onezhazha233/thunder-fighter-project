function Player_UpgradeWeapon(){
	if(Player_IsEnabled()){
		if(Player_GetRampage() = 0){
			if(Player_GetWeaponLevel() < 3){
				Player_SetWeaponLevel(Player_GetWeaponLevel()+1);
				layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_weapon_upgrade);
				audio_play_sound(snd_weapon_upgrade,0,0);
			}
			else{
				Player_SetRampage(global.rampage_duration,true);
			}
		}
		else{
			Player_SetRampage(global.rampage_duration,false);
		}
		return true;
	}
	else{
		return false;
	}
}