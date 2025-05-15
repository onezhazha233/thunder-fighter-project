function Macro_EnemyAnim(){
	enum ENEMY_STAT{
		PRE = 0,
		INTRO = 1,
		IDLE = 2,
		WITHDRAW = 3
	}
	
	enum DISPLAY_MODE{
		SPRITE = 0,
		SEQUENCE = 1
	}
	
	enum PRE_MODE{
		START_FRAME = 0,
		SEQUENCE = 1
	}
	
	enum IDLE_MODE{
		END_FRAME = 0,
		SEQUENCE = 1
	}
	
	enum COLLISION_TYPE{
		RECTANGLE = 0,
		SPRITE = 1
	}
}