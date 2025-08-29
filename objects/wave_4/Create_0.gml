live;
event_inherited();

enemy_0 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([-100, 160], [360, 160], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopEllipse(400, 360, 1, 0, 150,300);
});

enemy_1 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([820, 480], [360, 480], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopEllipse(400, 360, 3, 0, 150,300);
});

enemy_2 = new Enemy(enemy_7c1, emitter_enemy_c1, function() {
	EnemyMove_Pre([-100, 320], [160, 320], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopEllipse(400, 360, 2, 0, 120,300);
});

enemy_3 = new Enemy(enemy_7c1, emitter_enemy_c1, function() {
	EnemyMove_Pre([820, 320], [560, 320], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopEllipse(400, 360, 0, 0, 120,300);
});

ds_queue_enqueue(enemies, [[enemy_0, enemy_1], 30]);
ds_queue_enqueue(enemies, [[enemy_2, enemy_3], 50]);