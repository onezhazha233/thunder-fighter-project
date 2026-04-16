live;
event_inherited();

enemy_0 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([-200, 700], [520, 360], 40);
	EnemyMove_Intro(60);
	if(time = 150){
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,360-x,100);
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,580-y,100);
	}
	EnemyMove_LoopLinear([360,580], [520,400], 250, 200);
});

enemy_1 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([920, 700], [200, 360], 40);
	EnemyMove_Intro(60);
	if(time = 150){
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,360-x,100);
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,580-y,100);
	}
	EnemyMove_LoopLinear([360,580], [200,400], 250, 200);
});

ds_queue_enqueue(enemies, [[enemy_0], 100]);
ds_queue_enqueue(enemies, [[enemy_1], 30]);