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

layers = layer_get_all()
for(i=0;i<array_length(layers);i+=1){
	elements = layer_get_all_elements(layers[i]);
	for(j=0;j<array_length(elements);j+=1){
		if(layer_get_element_type(elements[j]) = layerelementtype_sequence){
			if(layer_sequence_get_speedscale(elements[j]) > 0){
				layer_sequence_speedscale(elements[j],game_get_speed(gamespeed_fps)/60);
			}
		}
	}
}

if(keyboard_check_pressed(vk_space)){
	if(player.rampage_duration > 0){
		player.SetRampageDuration(0);
	}
	else{
		player.SetRampageDuration(global.rampage_duration);
	}
}

if(keyboard_check_pressed(vk_up)){
	player.equipment.SetWeaponLevel(min(3,player.equipment.weapon_level+1));
	if(player.equipment.weapon_level < 3)layer_sequence_create("item_effects",player.x,player.y,seq_battle_item_effect_weapon_upgrade);
}
if(keyboard_check_pressed(vk_down))player.equipment.SetWeaponLevel(max(0,player.equipment.weapon_level-1));