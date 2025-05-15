live;
event_inherited();

enemy_0 = new Enemy(enemy_12c0,emitter_enemy_c0,function(){EnemyMove_1()})
enemy_1 = new Enemy(enemy_4b,emitter_enemy_b,function(){EnemyMove_2()})
enemy_2 = new Enemy(enemy_4b,emitter_enemy_b,function(){EnemyMove_3()})

ds_queue_enqueue(enemies,[[enemy_0],200])
ds_queue_enqueue(enemies,[[enemy_1,enemy_2,],200])
//ds_queue_enqueue(enemies,[[enemy_test1],1])