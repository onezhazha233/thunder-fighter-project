live;
event_inherited();

enemy_0 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([-120, 100], [240, 160], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([240,160], [480,160], 120, 240, 40);
});

enemy_1 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([840, 100], [480, 160], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([480,160], [240,160], 120, 240, 40);
});

enemy_2 = new Enemy(enemy_7c1, emitter_enemy_c1, function() {
	EnemyMove_Pre([360, -160], [360, 320], 40);
	EnemyMove_Intro(70);
	EnemyMove_LoopEllipse(320, 200, 1, 0, 150, 320);
});

enemy_3 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([-160, 640], [200, 560], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([200,560], [520,560], 160, 260, 40);
});

enemy_4 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([880, 640], [520, 560], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([520,560], [200,560], 160, 260, 40);
});

ds_queue_enqueue(enemies, [[enemy_0, enemy_1], 30]);
ds_queue_enqueue(enemies, [[enemy_2], 40]);
ds_queue_enqueue(enemies, [[enemy_3, enemy_4], 60]);

