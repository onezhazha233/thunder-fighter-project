live;
event_inherited();

enemy_0 = new Enemy(enemy_12c0,emitter_enemy_c0,function(){
	EnemyMove_Pre([360, -200], [360, 400], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([360, 400], [360, 250], 120, 300, 0);
})
enemy_1 = new Enemy(enemy_4b,emitter_enemy_b,function(){
	EnemyMove_Pre([200, -200], [200, 320], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([200, 320], [100, 220], 100, 200, 0);
})
enemy_2 = new Enemy(enemy_4b,emitter_enemy_b,function(){
	EnemyMove_Pre([520, -200], [520, 320], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([520, 320], [620, 220], 100, 200, 0);
})

ds_queue_enqueue(enemies,[[enemy_0],30])
ds_queue_enqueue(enemies,[[enemy_1,enemy_2,],200])