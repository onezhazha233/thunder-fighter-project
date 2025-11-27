live;
event_inherited();

/*enemy_0 = new Enemy(enemy_4b,emitter_enemy_b,function(){
	EnemyMove_Pre([360, -200], [360, 320], 40);
	EnemyMove_Intro(60);
	if(time = 100){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,120,120);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y,60,120);
	}
	EnemyMove_LoopEllipse(240,120,0,1,220,480);
})*/
enemy_0 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360, -200], [360, 320], 40);
	EnemyMove_Intro(60);
})
enemy_1 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360, -200], [160, 120], 40);
	EnemyMove_Intro(60);
})
enemy_2 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360, -200], [560, 520], 40);
	EnemyMove_Intro(60);
})

ds_queue_enqueue(enemies,[[enemy_0,enemy_1,enemy_2],200])
//ds_queue_enqueue(enemies,[[enemy_0],200])