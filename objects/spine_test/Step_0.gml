live;
if(keyboard_check_pressed(ord("W"))){
	if(anim < ds_list_size(list)){
		anim += 1;
		skeleton_animation_set(list[|anim]);
	}
}
if(keyboard_check_pressed(ord("S"))){
	if(anim > 0){
		anim -= 1;
		skeleton_animation_set(list[|anim]);
	}
}