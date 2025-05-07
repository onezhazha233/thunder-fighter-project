live;
event_inherited();

if(keyboard_check_pressed(vk_space)){
	plane.bullet_emitter.SetRampage(!plane.bullet_emitter.rampage);
	if(state = 1){
		SetRampage(0);
	}
	else if(state = 0){
		SetRampage(1);
	}
}