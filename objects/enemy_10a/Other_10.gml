live;
event_inherited();

OnDie = function(){
	multipler = 1;
	if(Player_GetRampage() > 0){
		instance_create_depth(x,y,0,battle_effect_score_x2);
		multipler += 1;
	}
	Player_AddScore(2*multipler);
}