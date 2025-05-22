live;
event_inherited();

if(keyboard_check_pressed(vk_space)){
	if(player.rampage_duration > 0){
		player.SetRampageDuration(0);
	}
	else{
		player.SetRampageDuration(300);
	}
}