///@arg damage
///@arg armor_ability
function Player_Hurt(){
	var DAMAGE = argument[0];
	var ARMOR_ABILITY = true;
	if(argument_count >= 2){
		ARMOR_ABILITY = argument[1];
	}
	
	if(instance_exists(player.equipment.armor_inst)&&ARMOR_ABILITY = true){
		DAMAGE = player.equipment.armor_inst.ArmorAbility(1,DAMAGE);
	}
	
	global.hp -= DAMAGE;
}