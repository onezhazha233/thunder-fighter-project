live;
Anim_Step()

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
		destroy_type = 0;
		instance_destroy();
	}
}

if(keyboard_check_pressed(vk_space)){
	if(player.rampage_duration > 0){
		player.SetRampageDuration(0);
	}
	else{
		player.SetRampageDuration(300);
	}
}

if(keyboard_check_pressed(vk_up))player.equipment.plane.bullet_emitter.SetLevel(min(3,player.equipment.plane.bullet_emitter.weapon_level+1));
if(keyboard_check_pressed(vk_down))player.equipment.plane.bullet_emitter.SetLevel(max(0,player.equipment.plane.bullet_emitter.weapon_level-1));