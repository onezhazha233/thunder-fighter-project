live;
event_inherited();

SetMoveInfo = function(){
	move_range = [250,250,720-250,350];
	move_distance = [80,180];
	move_duration = [40,80];
	move_interval = [10,20];
}

OnDie = function(){
	Player_AddScore(1000);
	MakeBossCrystal(x,y,1000);
}