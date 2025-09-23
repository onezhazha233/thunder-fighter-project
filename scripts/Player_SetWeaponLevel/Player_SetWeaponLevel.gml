function Player_SetWeaponLevel(level){
	if(Player_IsEnabled()){
		player.equipment.SetWeaponLevel(level);
		return true;
	}
	else{
		return false;
	}
}