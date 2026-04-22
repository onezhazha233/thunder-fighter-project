live;
event_inherited();

test = 0
if(test = 0){
	enemy_0 = new Enemy(enemy_og0b,emitter_enemy_og0b,function(){
		EnemyMove_Pre([360, -200], [360, 320], 40);
		EnemyMove_Intro(60);
		if(time = 100){
			Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,120,120);
			Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y,60,120);
		}
		EnemyMove_LoopEllipse(240,120,0,1,220,480);
	});
	
	ds_queue_enqueue(enemies,[[enemy_0],200])
}
else{
	/*enemy_0 = new Enemy(enemy_damagetest,noone,function(){
		EnemyMove_Pre([360, -200], [360, 320], 40);
		EnemyMove_Intro(60);
	})*/
	enemy_1 = new Enemy(enemy_og0b,emitter_enemy_og0b,function(){
		EnemyMove_Pre([360, -200], [360, 460], 40);
		EnemyMove_Intro(60);
	})
	enemy_2 = new Enemy(enemy_og0b,emitter_enemy_og0b,function(){
		EnemyMove_Pre([360, -200], [130, 360], 40);
		EnemyMove_Intro(60);
	})
	enemy_3 = new Enemy(enemy_og0b,emitter_enemy_og0b,function(){
		EnemyMove_Pre([360, -200], [720-130, 360], 40);
		EnemyMove_Intro(60);
	})
	enemy_4 = new Enemy(enemy_og0c0,emitter_enemy_og0c0,function(){
		EnemyMove_Pre([360, -200], [360, 220], 40);
		EnemyMove_Intro(60);
	})
	enemy_5 = new Enemy(enemy_og0c1,emitter_enemy_og0c1,function(){
		EnemyMove_Pre([360, -200], [180+180, 600-200], 40);
		EnemyMove_Intro(60);
	})
	enemy_6 = new Enemy(enemy_og0c1,emitter_enemy_og0c1,function(){
		EnemyMove_Pre([360, -200], [540, 600], 40);
		EnemyMove_Intro(60);
	})

	ds_queue_enqueue(enemies,[[enemy_5],200]);
}

//instance_create_depth(300,300,0,battle_item_rampage)
//instance_create_depth(300,300,0,battle_item_hp_recovery)
//instance_create_depth(300,300,0,battle_item_weapon_upgrade)
//instance_create_depth(300,300,0,battle_item_quantum_shield)