///@arg damage
function Player_Hurt(){
	var DAMAGE = argument[0];
	
	if(instance_exists(player.equipment.armor_inst)){
		DAMAGE = player.equipment.armor_inst.ArmorAbility(1,DAMAGE);
	}
	
	global.hp -= DAMAGE;
}