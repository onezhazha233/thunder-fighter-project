live;
event_inherited();

enemy = new Enemy(enemy_0a,noone,function(){
	if(time = 1){
		x = 791+ox;
		y = 369+oy;
		// --- 高阶路径 (支持画外坐标) ---
		var _p = Bezier_Path_Create(x, y, 753+ox, -89+oy);

		Bezier_Path_Add_Point(_p, 247+ox, 822+oy);
		Bezier_Path_Add_Point(_p, 84+ox, 438+oy);

		// 应用于动画：
		Anim_Path_Create(id, _p, ANIM_TWEEN.SINE, ANIM_EASE.OUT, 300);
		xp = x;
		yp = y;
	}
	if(time = 300){
		instance_destroy();
	}
	image_angle = point_direction(x,y,xp,yp) - 90;
	xp = x;
	yp = y;
})