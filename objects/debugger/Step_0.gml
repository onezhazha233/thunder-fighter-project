live;
if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(keyboard_check_pressed(vk_f3)){
	if(game_get_speed(gamespeed_fps) = 60){
		game_set_speed(10,gamespeed_fps);
	}
	else if(game_get_speed(gamespeed_fps) = 10){
		game_set_speed(3,gamespeed_fps);
	}
	else if(game_get_speed(gamespeed_fps) = 3){
		game_set_speed(60,gamespeed_fps);
	}
}

if(keyboard_check_pressed(ord("C"))){
	with(bullet_enemy){
		if(inv_block = true){
			destroy_type = 4;
		}
		else{
			destroy_type = 0;
		}
		instance_destroy();
	}
}

if(instance_exists(player)){
	if(keyboard_check_pressed(vk_space)){
		if(Player_GetRampage() = 0){
			Player_SetRampage(global.rampage_duration,true);
		}
		else{
			Player_SetRampage(0,false);
		}
	}
	
	if(keyboard_check_pressed(ord("Q"))){
		if(Player_GetShield() = 0){
			Player_SetShield(global.quantum_shield_duration)
		}
		else{
			with(battle_quantum_shield)duration = 1;
		}
	}

	if(keyboard_check_pressed(ord("W"))){
		Player_UpgradeWeapon();
	}
	if(keyboard_check_pressed(ord("S"))){
		Player_SetWeaponLevel(max(0,Player_GetWeaponLevel()-1));
	}
}