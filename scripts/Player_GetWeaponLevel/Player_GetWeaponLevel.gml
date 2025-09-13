function Player_GetWeaponLevel(){
	if(instance_exists(player)&&instance_exists(player.equipment)){
		return player.equipment.weapon_level;
	}
	else{
		return -1;
	}
}