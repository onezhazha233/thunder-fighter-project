live;
persistent=1;
depth=-99999
_screen_saving=noone;
seq = -1
wait_resume = false

pause_state = 0//0为未暂停 1为暂停动画播放中 2为暂停动画停止 3为解除暂停动画播放中

Pause = function(){
	if(pause_state = 0){
		if (sprite_exists(_screen_saving)) sprite_delete(_screen_saving);
	    _screen_saving = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0) instance_deactivate_all(1);
	    audio_pause_all();
		al = layer_get_all()
		for(l=0;l<array_length(al);l+=1){
			elements = layer_get_all_elements(al[l]);
			var len = array_length(elements);
			if(len > 0){
				for (var i = 0; i < len; ++i){
					var el = elements[i];
					if(layer_get_element_type(el) = layerelementtype_sequence){
						layer_sequence_pause(el);
					}
				}
			}
		}
		pause_state = 1;
		seq = layer_sequence_create(ll,room_width/2,room_height/2,seq_ui_pause);
		audio_play_sound(snd_pause,0,0);
	}
}

Resume = function(){
	if(pause_state = 2){
		layer_sequence_destroy(seq);
		seq = layer_sequence_create(ll,room_width/2,room_height/2,seq_ui_resume);
		audio_play_sound(snd_resume,0,0);
		pause_state = 3;
	}
}