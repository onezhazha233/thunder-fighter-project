///@arg heal
///@arg duration*
function Player_Heal(){
	var HEAL = argument[0];
	var DURATION = 20;
	if(argument_count >= 2){
		DURATION = argument[1];
	}
	a = instance_create_depth(0,0,0,battle_item_hp_recovery_healer);
	a.heal = HEAL;
	a.duration = DURATION;
}