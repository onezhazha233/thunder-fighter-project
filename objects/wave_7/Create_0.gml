live;
event_inherited();

enemy_0 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([360, -100], [360, 360], 40);
	EnemyMove_Intro(60);
	if(time = 150){
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,200-y,100);
	}
	EnemyMove_LoopLinear([360,200], [360,520], 250, 200);
});

enemy_1 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([360, -100], [360, 360], 40);
	EnemyMove_Intro(60);
	if(time = 90){
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,160-x,60);
	}
	if(time = 150){
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,520-y,100);
	}
	EnemyMove_LoopLinear([160,520], [160,200], 250, 200);
});

enemy_2 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([360, -100], [360, 360], 40);
	EnemyMove_Intro(60);
	if(time = 90){
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,560-x,60);
	}
	if(time = 150){
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,520-y,100);
	}
	EnemyMove_LoopLinear([560,520], [560,200], 250, 200);
});

ds_queue_enqueue(enemies, [[enemy_0,enemy_1,enemy_2], 30]);