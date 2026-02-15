live;
event_inherited();

if(!intro_move_done && state == ENEMY_STATE.IDLE){
	intro_move_timer += 1;
	if(!intro_move_started){
		intro_move_started = true;
		intro_move_timer = 0;
		move_enabled = false;
		move_state = 0;
		Anim_Destroy(id,"x");
		Anim_Destroy(id,"y");
		var target1_x = 360;
		var target1_y = 960;
		var target2_x = random_range(200,520);
		var target2_y = random_range(200,500);
		Anim_Create(id,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,x,target1_x-x,40);
		Anim_Create(id,"y",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,y,target1_y-y,40);
		Anim_Create(id,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,target1_x,target2_x-target1_x,40,40);
		Anim_Create(id,"y",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,target1_y,target2_y-target1_y,40,40);
	}
	if(intro_move_timer >= 80){
		move_enabled = true;
		move_starttime = time;
		move_nexttime = time;
		move_state = 0;
		intro_move_done = true;
	}
}
