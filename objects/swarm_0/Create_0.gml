live;
event_inherited();

enemy = new Enemy(enemy_0a,noone,function(){
	if(time = 1){
		x = -30+ox;
		y = 140+oy;
		var _p = Bezier_Path_Create(x,y,750+ox,140+oy);
		Bezier_Path_Add_Point(_p,1120+ox,400+oy);
		Bezier_Path_Add_Point(_p,360+ox,950+oy);
		Bezier_Path_Add_Point(_p,-400+ox,400+oy);
		Anim_Path_Create(id,_p,0,0,120);
		xp = x;
		yp = y;
	}
	if(time = 120){
		instance_destroy();
	}
	image_angle = point_direction(x,y,xp,yp) - 90;
	xp = x;
	yp = y;
})