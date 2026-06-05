function Macro_EnemyAnim(){
	enum ENEMY_STATE{
		PRE = 0,
		INTRO = 1,
		IDLE = 2,
		WITHDRAW = 3
	}
	
	enum ENEMY_DISPLAY_MODE{
		SPRITE = 0,
		SEQUENCE = 1
	}
	
	enum ENEMY_PRE_MODE{
		START_FRAME = 0,
		SEQUENCE = 1
	}
	
	enum ENEMY_IDLE_MODE{
		END_FRAME = 0,
		SEQUENCE = 1
	}
	
	enum COLLISION_TYPE{
		RECTANGLE = 0,
		SPRITE = 1
	}
}