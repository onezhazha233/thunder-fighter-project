live;

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(ord("E"))){
	enabled = !enabled;
	SetEnabled(enabled);
}

//if(instance_exists(tb))tb.y += sin(current_time/50)*8