function Player_SetLastItem(item){
	if(Player_IsEnabled()){
		player.last_item = item[0];
		player.equipment.armor_inst.ArmorAbility(4,item);
		return true;
	}
	else{
		return false;
	}
}