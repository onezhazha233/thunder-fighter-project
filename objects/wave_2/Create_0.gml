live;
event_inherited();

enemy_0 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([-100, 200], [120, 200], 40);
    EnemyMove_Intro(90);
    EnemyMove_LoopLinear([120, 200], [240, 200], 130, 200, 0);
});

enemy_1 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([360, -100], [360, 300], 40);
    EnemyMove_Intro(70);
    EnemyMove_LoopLinear([360, 300], [360, 440], 100, 180, 0);
});

enemy_2 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([820, 200], [600, 200], 40);
    EnemyMove_Intro(90);
    EnemyMove_LoopLinear([600, 200], [480, 200], 130, 200, 0);
});

ds_queue_enqueue(enemies, [[enemy_0,enemy_2], 30]);
ds_queue_enqueue(enemies, [[enemy_1], 20]);