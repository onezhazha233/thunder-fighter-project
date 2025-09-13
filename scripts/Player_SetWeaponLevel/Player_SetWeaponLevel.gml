function Player_SetWeaponLevel(level){
	if(instance_exists(player)&&instance_exists(player.equipment)){
		player.equipment.SetWeaponLevel(level);
		return true;
	}
	else{
		return false;
	}
}