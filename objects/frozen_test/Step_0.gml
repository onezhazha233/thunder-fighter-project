live;
if(keyboard_check_pressed(ord("F"))){
	if(frozen_duration > 0){
		SetFrozen(0);
	}
	else{
		SetFrozen(frozen_time);
	}
}
if(frozen_amount >= frozen_target && frozen_cd <= 0){
	frozen_amount = 0;
	SetFrozen(frozen_time);
}
if(frozen_duration > 0){
	frozen_amount = 0;
	frozen_duration -= 1;
	if(frozen_duration mod 5 = 0){
		SpawnFrozenGrid(effect_enemy_snowflake_fog, spr_effect_enemy_snowflake, 0.85, 0.02);
	}
}
if(frozen_duration = 0){
	SetFrozen(0);
}
if(frozen_cd > 0){
	frozen_cd -= 1;
}
