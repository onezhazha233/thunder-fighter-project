live;
depth=-99999
_screen_saving=noone;
seq = -1
seq1 = -1

pause_state = 0//0为未暂停 1为暂停动画播放中 2为暂停动画停止 3为解除暂停动画播放中
button_xoffset = 220

main_ui = new UIBase(0,0,room_width,room_height);

quit_button = new UIButton(spr_ui_pause_button_quit,10+12-210,640-62+4,174,62)
quit_button.draw = function(el){
	draw_sprite(spr_ui_pause_button_base,0,el.abs_x-12-10,el.abs_y-4+10);
    draw_sprite(spr_ui_pause_button_quit,el.is_pressed,el.abs_x-12,el.abs_y-4);
}
quit_button.AddEvent(UI_EVENT.CLICK,function(el){
	SFX_Play(snd_touch);
	el.parent.active = false;
	other.button_xoffset = 230;
	el.x = 10+12 - other.button_xoffset;
	other.resume_button.x = 360+152+12 + other.button_xoffset;
	audio_stop_all();
	BGM_StopAll();
	other.pause_state = 0;
	layer_sequence_destroy(other.seq);
	instance_activate_all();
	if(room = room_preparation){
		room_restart();
	}
	else{
		room_goto(room_preparation);
	}
	fader.alpha = 1;
	Fader_Fade(1,0,10);
	Layer_Init();
});

resume_button = new UIButton(spr_ui_pause_button_resume,10+12-210,640-62+4,174,62)
resume_button.draw = function(el){
	draw_sprite_ext(spr_ui_pause_button_base,0,el.abs_x-12+208,quit_button.abs_y-4+10,-el.abs_scale_x,el.abs_scale_y,0,-1,el.abs_alpha);
    draw_sprite(spr_ui_pause_button_resume,el.is_pressed,el.abs_x-12,el.abs_y-4);
}
resume_button.AddEvent(UI_EVENT.CLICK,function(el){
	SFX_Play(snd_touch);
	Game_Resume();
});

main_ui.AddContent(quit_button)
main_ui.AddContent(resume_button)

Pause = function(){
	if(pause_state = 0){
		if (sprite_exists(_screen_saving)) sprite_delete(_screen_saving);
	    _screen_saving = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0)
		instance_deactivate_all(true);
	    audio_pause_all();
		al = layer_get_all()
		for(l=0;l<array_length(al);l+=1){
			elements = layer_get_all_elements(al[l]);
			var len = array_length(elements);
			if(len > 0){
				for (var i = 0; i < len; ++i){
					var el = elements[i];
					if(layer_get_element_type(el) = layerelementtype_sequence&&layer_sequence_get_speedscale(el) != 0){
						layer_sequence_pause(el);
					}
				}
			}
		}
		pause_state = 1;
		seq = layer_sequence_create(ll,room_width/2,room_height/2,seq_ui_pause);
		SFX_Play(snd_pause);
		BGM_Pause(0);
	}
}

Resume = function(){
	if(pause_state = 2){
		alarm[0] = 1;
		seq1 = layer_sequence_create(ll,room_width/2,room_height/2,seq_ui_resume);
		SFX_Play(snd_resume);
		pause_state = 3;
	}
}