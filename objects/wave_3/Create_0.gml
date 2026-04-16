live;
event_inherited();

enemy_0 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
	EnemyMove_Pre([-100, 200], [560, 200], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([560, 200], [280, 200], 100, 300, 30);
});

enemy_1 = new Enemy(enemy_9c1, emitter_enemy_c2, function() {
	EnemyMove_Pre([820, 420], [160, 420], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([160, 420], [440, 420], 100, 300, 30);
});

ds_queue_enqueue(enemies, [[enemy_0, enemy_1], 50]);