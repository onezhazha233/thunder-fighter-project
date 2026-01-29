live;
event_inherited();

enemy = new Enemy(enemy_2a,noone,function(){
	if(time = 1){
		x = -80+ox;
		y = -50+oy;
		var _p = Bezier_Path_Create(x,y,780+ox,600+oy);
		Bezier_Path_Add_Point(_p,160+ox,650+oy);
		Bezier_Path_Add_Point(_p,380+ox,-150+oy);
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