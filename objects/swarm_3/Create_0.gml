live;
event_inherited();

enemy = new Enemy(enemy_10a,noone,function(){
	if(time = 1){
		x = -100+ox;
		y = 250+oy;
		var _p = Bezier_Path_Create(x,y,800+ox,350+oy);
		Bezier_Path_Add_Point(_p,1420+ox,-90+oy);
		Bezier_Path_Add_Point(_p,-800+ox,690+oy);
		Anim_Path_Create(id,_p,0,0,100);
		xp = x;
		yp = y;
	}
	if(time = 100){
		instance_destroy();
	}
	image_angle = point_direction(x,y,xp,yp) - 90;
	xp = x;
	yp = y;
})