live;

switch (phase) {
	case 0:
		/*fade_alpha = min(1, fade_alpha + fade_speed);
		if (fade_alpha >= 1) {
			phase = 1;
			room_goto(room_battle_loading);
		}*/
		if(anim.state = 0&&!Anim_IsExists(anim,"up_y")){
			phase = 1;
			room_goto(room_battle_loading);
		}
	break;

	case 1:
		if (room != room_battle_loading) break;

		if!(layer_exists(preload_layer)) {
			preload_layer = layer_create(0);
		}

		while (array_length(preload_active) < 10 && preload_index < array_length(preload_list)) {
			var _seq = layer_sequence_create(preload_layer, 360, 640, preload_list[preload_index]);
			array_push(preload_active, _seq);
			preload_index++;
		}

		for (var i = array_length(preload_active) - 1; i >= 0; --i) {
			var _seq = preload_active[i];
			if (!layer_sequence_exists(preload_layer, _seq) || layer_sequence_is_finished(_seq)) {
				if (layer_sequence_exists(preload_layer, _seq)) {
					layer_sequence_destroy(_seq);
				}
				array_delete(preload_active, i, 1);
			}
		}

		if (preload_index >= array_length(preload_list) && array_length(preload_active) == 0) {
			if(anim.state = 1){
				phase = 2;
				anim.state = 2;
				anim.time = 0;
			}
		}
	break;

	case 2:
		if(anim.state = 2&&anim.time = 70){
			phase = 3;
			room_goto(room_battle);
		}
		/*fade_alpha = max(0, fade_alpha - fade_speed);
		if (fade_alpha <= 0) {
			phase = 3;
		}*/
	break;

	case 3:
		if(instance_exists(anim)){
			if(anim.state = 2&&anim.time = 90){
				global.battle_loading_done = true;
			}
		}
		if!(instance_exists(anim)){
			instance_destroy();
		}
	break;
}
