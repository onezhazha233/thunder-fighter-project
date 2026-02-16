live;
event_inherited();

enemy_0 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([-120, 120], [200, 180], 40);
	EnemyMove_Intro(60);
	if(time = 1){
		loop_start_time = 80;
		loop_duration = 200;
	}
	if(time >= loop_start_time){
		if((time-loop_start_time) mod loop_duration = 0){
			var _sx = x;
			var _sy = y;
			var _p = Bezier_Path_Create(_sx, _sy, _sx, _sy);
			// C1 闭合：首尾切线一致
			Bezier_Path_Add_Point(_p, _sx + 220, _sy - 120);
			Bezier_Path_Add_Point(_p, _sx + 120, _sy + 180);
			Bezier_Path_Add_Point(_p, _sx - 120, _sy + 180);
			Bezier_Path_Add_Point(_p, _sx - 220, _sy + 120);
			Anim_Path_Create(id, _p, 0, 0, loop_duration);
		}
	}
});

enemy_1 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([840, 300], [520, 360], 40);
	EnemyMove_Intro(60);
	if(time = 1){
		loop_start_time = 90;
		loop_duration = 220;
	}
	if(time >= loop_start_time){
		if((time-loop_start_time) mod loop_duration = 0){
			var _sx = x;
			var _sy = y;
			var _p = Bezier_Path_Create(_sx, _sy, _sx, _sy);
			Bezier_Path_Add_Point(_p, _sx + 200, _sy - 140);
			Bezier_Path_Add_Point(_p, _sx + 80, _sy + 200);
			Bezier_Path_Add_Point(_p, _sx - 80, _sy + 200);
			Bezier_Path_Add_Point(_p, _sx - 200, _sy + 140);
			Anim_Path_Create(id, _p, 0, 0, loop_duration);
		}
	}
});

enemy_2 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([-140, 660], [220, 600], 40);
	EnemyMove_Intro(60);
	if(time = 1){
		loop_start_time = 100;
		loop_duration = 240;
	}
	if(time >= loop_start_time){
		if((time-loop_start_time) mod loop_duration = 0){
			var _sx = x;
			var _sy = y;
			var _p = Bezier_Path_Create(_sx, _sy, _sx, _sy);
			Bezier_Path_Add_Point(_p, _sx + 200, _sy - 100);
			Bezier_Path_Add_Point(_p, _sx + 120, _sy + 160);
			Bezier_Path_Add_Point(_p, _sx - 120, _sy + 160);
			Bezier_Path_Add_Point(_p, _sx - 200, _sy + 100);
			Anim_Path_Create(id, _p, 0, 0, loop_duration);
		}
	}
});

ds_queue_enqueue(enemies, [[enemy_0, enemy_1], 40]);
ds_queue_enqueue(enemies, [[enemy_2], 70]);

