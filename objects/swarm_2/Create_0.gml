live;
event_inherited();

enemy = new Enemy(enemy_4a,noone,function(){
	if(time = 1){
		x = 550+ox;
		y = -50+oy;
		var _p = Bezier_Path_Create(x,y,800+ox,340+oy);
		Bezier_Path_Add_Point(_p,240+ox,1180+oy);
		Bezier_Path_Add_Point(_p,-460+ox,-370+oy);
		Anim_Path_Create(id,_p,0,0,80);
		xp = x;
		yp = y;
	}
	if(time = 80){
		instance_destroy();
	}
	image_angle = point_direction(x,y,xp,yp) - 90;
	xp = x;
	yp = y;
})