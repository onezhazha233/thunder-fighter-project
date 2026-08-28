live;
Player_SetBreaktime(true)

if!(layer_sequence_exists(ll,warning)){
	instance_destroy();
}
if(instance_exists(warning_text)){
	warning_text.lv = lv;
	warning_text.name = name;
	if(!is_string(lv)&&!is_real(lv)){
		warning_text.lv_spr = true;
		warning_text.lv_spr_img = lv_spr_img;
	}
}