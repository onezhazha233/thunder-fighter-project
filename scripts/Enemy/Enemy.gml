function Enemy(enemy,emitter,mover) constructor{
	enemy_obj = enemy;
	emitter_obj = emitter;
	mover_func = mover;
	
	Create = function(){
		a = instance_create_depth(-1000,-1000,0,enemy_obj);
		with(a) {
            bullet_emitter = other.emitter_obj;
            mover = method(self,other.mover_func);
        }
		
		return a;
	}
}