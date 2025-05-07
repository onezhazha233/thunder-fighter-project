event_inherited();

if(keyboard_check_pressed(ord("T"))){
	SetSurfEnabled(!surf_enabled);
}

if(keyboard_check_pressed(vk_up))bullet_emitter.SetLevel(min(3,bullet_emitter.weapon_level+1));
if(keyboard_check_pressed(vk_down))bullet_emitter.SetLevel(max(0,bullet_emitter.weapon_level-1));