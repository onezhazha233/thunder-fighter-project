live;

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(ord("E"))){
	enabled = !enabled;
	SetEnabled(enabled);
}