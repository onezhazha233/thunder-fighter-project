function Player_IsEnabled(){
	return instance_exists(player)&&instance_exists(player.equipment)&&!instance_exists(battle_ui_victory);
}