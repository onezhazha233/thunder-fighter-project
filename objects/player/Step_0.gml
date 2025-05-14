live;
if(place_meeting(x,y,bullet_enemy)&&global.inv = 0){
	event_user(0);
}

if(mouse_check_button(mb_left)) {
    var dx = (mouse_x-camera._shake_pos_x) - touch_start_x;
    var dy = (mouse_y-camera._shake_pos_y) - touch_start_y;
    
    x += dx;
    y += dy;
	
	x = clamp(20,x,room_width-20);
	y = clamp(20,y,room_height-20);
}

touch_start_x = (mouse_x-camera._shake_pos_x);
touch_start_y = (mouse_y-camera._shake_pos_y);

equipment.x = x
equipment.y = y
equipment.SetPosition(x,y);

if(global.inv > 0){
	if(global.inv mod 5 = 0){
		if(equipment.image_alpha = 1){
			equipment.image_alpha = 0.5;
		}
		else{
			equipment.image_alpha = 1;
		}
	}
}
global.inv = max(0,global.inv-1)

if(global.hp <= 0){
	instance_create_depth(x,y,0,effect_explosion_big);
	instance_create_depth(x,y,0,effect_explosion_ring_red);
	instance_create_depth(x,y,0,effect_explosion_ring_white);
	instance_destroy();
	instance_destroy(equipment_test);
}