function Player_Hurt(DAMAGE,ARMOR_ABILITY=true){
	if(Player_IsEnabled()){
		if(instance_exists(player.equipment.armor_inst)&&ARMOR_ABILITY = true){
			DAMAGE = player.equipment.armor_inst.ArmorAbility(1,DAMAGE);
		}
	
		global.hp -= DAMAGE;
	}
}