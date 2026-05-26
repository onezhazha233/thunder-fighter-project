live;
event_inherited();

SetMoveInfo = function(){
	move_range = [200,250,720-200,350];
	move_distance = [100,160];
	move_duration = [80,120];
	move_interval = [20,30];
}

OnDie = function(){
	Player_AddScore(1000);
	MakeBossCrystal(x,y,1000);
}