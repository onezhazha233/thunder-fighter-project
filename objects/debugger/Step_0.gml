live;
if(!variable_instance_exists(id,"bgm_mute")){
	bgm_mute = false;
	bgm_prev_gain = array_create(6,1);
}
if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(keyboard_check_pressed(vk_tab))debug_display = !debug_display;

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

if(keyboard_check_pressed(ord("M"))){
	if(bgm_mute = false){
		for(var i=0;i<6;i+=1){
			if(BGM_IsPlaying(i)){
				bgm_prev_gain[i] = audio_sound_get_gain(BGM_GetID(i));
				BGM_SetVolume(i,0,0);
			}else{
				bgm_prev_gain[i] = 1;
			}
		}
		bgm_mute = true;
	}else{
		for(var i=0;i<6;i+=1){
			var vol = bgm_prev_gain[i];
			if(is_undefined(vol))vol = 1;
			if(BGM_IsPlaying(i)){
				BGM_SetVolume(i,vol,0);
			}
		}
		bgm_mute = false;
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
			Player_SetShield(global.quantum_shield_duration);
		}
		else{
			Player_SetShield(-1);
		}
	}

	if(keyboard_check_pressed(ord("W"))){
		Player_UpgradeWeapon();
	}
	if(keyboard_check_pressed(ord("S"))){
		Player_SetWeaponLevel(max(0,Player_GetWeaponLevel()-1));
	}
}

if(keyboard_check_pressed(ord("K"))){
	with(enemy_agent){
		hp = 0;
	}
}

/*if (mouse_check_button_pressed(mb_right)) {
    is_drawing = true;
    start_x = mouse_x;
    start_y = mouse_y;
}

/// 拖动更新终点
if (is_drawing) {
    end_x = mouse_x;
    end_y = mouse_y;
}

/// 松开生成切割对象
if (mouse_check_button_released(mb_right) && is_drawing) {
    is_drawing = false;

    var inst = instance_create_depth(start_x, start_y, dd, camera_split);
    inst.image_angle = point_direction(start_x, start_y, end_x, end_y)+90;
	Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
	Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,120);
	inst.duration = 150;
	dd -= 1;
}*/