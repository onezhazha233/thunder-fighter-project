moveable = true
Player_SetBreaktime(false)

instance_destroy(equipment)
equipment = instance_create_depth(x,y,0,equipment_main)

with(equipment){
	enabled = true;

	xscale = 1;
	yscale = 1;

	plane = plane_agent;
	wingman_left = [plane_agent];
	wingman_right = [plane_agent];
	wingman_x_offset = global.current_equipment.wingman_x_offset;
	wingman_y_offset = global.current_equipment.wingman_y_offset;
	subweapon = subweapon_warper_d;
	armor = armor_agent;
}