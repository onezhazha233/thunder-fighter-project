function Player_GetPos(){
	var px = mouse_x;
	var py = mouse_y;
	if(Player_IsEnabled()){
		px = player.x;
		py = player.y;
	}
	return [px,py];
}