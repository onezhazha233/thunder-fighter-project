live;
tt = 230
if(pause_state = 1){
	button_xoffset -= button_xoffset*0.2;
	if(button_xoffset < 1)button_xoffset = 0;
}
if(pause_state = 3){
	button_xoffset += (tt - button_xoffset)*0.2;
	if(abs(button_xoffset-tt) < 1)button_xoffset = tt;
	
	if!(layer_sequence_exists(ll,seq1)){
		if(BGM_IsPaused(0))BGM_Resume(0);
	}
}
quit_button.x = 10+12 - button_xoffset
resume_button.x = 360+152+12 + button_xoffset

main_ui.active = (pause_state == 2)

main_ui.UpdatePosition()
main_ui.Update()
main_ui.ProcessInput()