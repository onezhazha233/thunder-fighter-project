live;
event_inherited();

enemy_0 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([-100, 160], [120, 160], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([120,160], [280,160], 120, 250);
});

enemy_1 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([-100, 300], [280, 300], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([280,300], [120,300], 90, 250);
});

enemy_2 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([-100, 440], [120, 440], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([120,440], [280,440], 120, 250);
});

enemy_3 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([820, 160], [600, 160], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([600,160], [460,160], 120, 250);
});

enemy_4 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([820, 300], [460, 300], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([460,300], [600,300], 90, 250);
});

enemy_5 = new Enemy(enemy_4b, emitter_enemy_b, function() {
	EnemyMove_Pre([820, 440], [600, 440], 40);
	EnemyMove_Intro(60);
	EnemyMove_LoopLinear([600,440], [460,440], 120, 250);
});

ds_queue_enqueue(enemies, [[enemy_0, enemy_2,enemy_3, enemy_5], 30]);
ds_queue_enqueue(enemies, [[enemy_1,enemy_4], 50]);