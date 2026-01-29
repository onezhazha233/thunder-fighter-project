live;
event_inherited();

enemy = new Enemy(enemy_12a,noone,function(){
	if(time = 1){
		x = -70+ox;
		y = 420+oy;
		var _p = Bezier_Path_Create(x,y,-90+ox,160+oy);
		Bezier_Path_Add_Point(_p,830+ox,900+oy);
		Bezier_Path_Add_Point(_p,980+ox,450+oy);
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