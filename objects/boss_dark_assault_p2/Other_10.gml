live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,150,570,1000];
	move_distance = [300,700];
	move_duration = [20,30];
	move_interval = [0,5];
}

OnDie = function(){
	Player_AddScore(1000);
	MakeBossCrystal(x,y,1000);
}