live;
event_inherited();

/*enemy_0 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360,-200], [360,-320], 40);
})

/*enemy_1 = new Enemy(enemy_damagetest,noone,function(){
	EnemyMove_Pre([360,-200], [360,500], 40);
})*/


/*enemy_0 = new Enemy(enemy_4b,emitter_enemy_b,function(){
	EnemyMove_Pre([360, -200], [360, 320], 40);
	EnemyMove_Intro(60);
	if(time = 100){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,120,120);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y,60,120);
	}
	EnemyMove_LoopEllipse(240,120,0,1,220,480);
})*/

//ds_queue_enqueue(enemies,[[enemy_0],200])

warning = {
	obj : battle_warning_boss,
	lv : 10,
	name : "asd",
	
	Create : function(){
		ww = instance_create_depth(0,0,DEPTH_BATTLE.UI,obj);
		ww.lv = lv;
		ww.name = name;
		
		return ww;
	}
}

boss = {
	enemy_obj : boss_test_0,
	emitter_obj : emitter_enemy_knight,
	
	Create : function(){
		enemy = instance_create_depth(room_width/2,-200,0,enemy_obj);
		enemy.bullet_emitter = emitter_obj;
		
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[boss],200])
//ds_queue_enqueue(enemies,[[boss],200])