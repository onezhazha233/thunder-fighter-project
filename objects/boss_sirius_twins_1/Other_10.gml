live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,500];
	move_distance = [150,300];
	move_duration = [40,60];
	move_interval = [20,30];
}

TakeDamage = function(dmg){
	with(boss_sirius_twins_0)TakeDamage(dmg);
}