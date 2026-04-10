live;
tt = 230
if(pause_state = 1){
	button_xoffset -= button_xoffset*0.2;
	if(button_xoffset < 1)button_xoffset = 0;
}
if(pause_state = 3){
	button_xoffset += (tt - button_xoffset)*0.2;
	if(abs(button_xoffset-tt) < 1)button_xoffset = tt;
}
quit_button.x = 10+12 - button_xoffset
resume_button.x = 360+152+12 + button_xoffset
quit_button._updateViewRegion()
resume_button._updateViewRegion()
quit_button.is_visible_in_region = true
resume_button.is_visible_in_region = true

if (variable_struct_exists(self, "main_ui") && !is_undefined(main_ui)) {
	main_ui.update();
}