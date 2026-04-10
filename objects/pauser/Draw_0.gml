live;
if!(pause_state = 0){
	draw_sprite(_screen_saving,0,0,0);
	draw_surface(surf,0,0);
}

if(layer_sequence_get_sequence(seq) = sequence_get(seq_ui_pause)){
	if(layer_sequence_is_finished(seq)&&pause_state = 1){
		pause_state = 2;
	}
}

if(pause_state = 3){
	if!(layer_sequence_exists(ll,seq1)){
		instance_activate_all();
		audio_resume_all();
		al = layer_get_all()
		for(l=0;l<array_length(al);l+=1){
			elements = layer_get_all_elements(al[l]);
			var len = array_length(elements);
			if(len > 0){
				for (var i = 0; i < len; ++i){
					var el = elements[i];
					if(layer_get_element_type(el) = layerelementtype_sequence){
						layer_sequence_play(el);
					}
				}
			}
		}
		pause_state = 0;
	}
}

if(keyboard_check_pressed(ord("P"))){
	if(pause_state = 0){
		Game_Pause();
	}
	else if(pause_state = 2){
		Game_Resume();
	}
}

if (variable_struct_exists(self, "main_ui") && !is_undefined(main_ui)) {
	main_ui.render();
}

Sequence_PlayByFrame(ll)

/*draw_text(50,50,pause_state)
draw_text(50,100,button_xoffset)
draw_text(50,150,quit_button.x)
draw_text(50,200,resume_button.x)