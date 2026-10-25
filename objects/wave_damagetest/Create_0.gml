live;
event_inherited();

enemy_0 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360, -200], [360, 320], 40);
	EnemyMove_Intro(60);
})

ds_queue_enqueue(enemies,[[enemy_0],200]);