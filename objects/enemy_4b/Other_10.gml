live;
event_inherited();

OnDie = function(){
	Player_AddScore(90);
	repeat(2){
		a = MakeCrystal(x+random_range(bbox_left-x,bbox_right-x)*1.5,y+random_range(bbox_top-y,bbox_bottom-y)*2.5,0);
		a.vspeed = -random_range(6,10);
	}
}