function Player_GetWeaponLevel(){
	if(Player_IsEnabled()){
		return player.equipment.weapon_level;
	}
	else{
		return -1;
	}
}