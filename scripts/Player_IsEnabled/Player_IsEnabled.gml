function Player_IsEnabled(){
	return instance_exists(player)&&instance_exists(player.equipment);
}