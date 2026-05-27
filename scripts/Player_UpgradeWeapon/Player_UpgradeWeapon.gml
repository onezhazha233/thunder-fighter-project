function Player_UpgradeWeapon(){
	if(Player_IsEnabled()){
		if(Player_GetWeaponLevel() < 3){
			Player_SetWeaponLevel(Player_GetWeaponLevel()+1);
			layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_weapon_upgrade);
			SFX_Play(snd_weapon_upgrade);
		}
		else{
			Player_SetRampage(global.rampage_duration,true);
		}
		return true;
	}
	else{
		return false;
	}
}