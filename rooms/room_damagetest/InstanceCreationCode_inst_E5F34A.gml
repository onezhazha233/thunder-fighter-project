moveable = true
Player_SetBreaktime(false)

instance_destroy(equipment)
equipment = instance_create_depth(x,y,0,equipment_main)

with(equipment){
	enabled = true;

	xscale = 1;
	yscale = 1;

	plane = plane_agent;
	wingman_left = [wingman_annihilator_d];
	wingman_right = [wingman_annihilator_d];
	wingman_x_offset = global.current_equipment.wingman_x_offset;
	wingman_y_offset = global.current_equipment.wingman_y_offset;
	subweapon = emitter_player;
	armor = armor_agent;
}