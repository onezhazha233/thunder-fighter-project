function Player_UpgradeWeapon(){
	if(instance_exists(player)&&instance_exists(player.equipment)){
		if(Player_GetRampage() = 0){
			if(Player_GetWeaponLevel() < 3){
				Player_SetWeaponLevel(Player_GetWeaponLevel()+1);
				layer_sequence_create(global.layer_item_effects,x,y,seq_battle_item_effect_weapon_upgrade);
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