live;
event_inherited();

enemy = new Enemy(enemy_0a,noone,function(){
	if(time = 1){
		x = -69+ox;
		y = 107+oy;
		// --- 高阶路径 (支持画外坐标) ---
		var _p = Bezier_Path_Create(x, y, -100+ox, 322+oy);

		Bezier_Path_Add_Point(_p, 820+ox, 574+oy);

		// 应用于动画：
		Anim_Path_Create(id, _p, ANIM_TWEEN.SINE, ANIM_EASE.OUT, 120);
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