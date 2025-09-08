function Enemy(enemy,emitter,mover) constructor{
	enemy_obj = enemy;
	emitter_obj = emitter;
	mover_func = mover;
	
	Create = function(){
		enemy = instance_create_depth(360,-1000,DEPTH_BATTLE.ENEMIES,enemy_obj);
		with(enemy) {
            bullet_emitter = other.emitter_obj;
            mover = method(self,other.mover_func);
        }
		
		return enemy;
	}
}