if (variable_struct_exists(self, "main_ui") && !is_undefined(main_ui) && !main_ui.is_destroyed) {
	main_ui.destroy();
}
if (variable_struct_exists(global, "_current_equipment_select")) {
	if (!is_undefined(global._current_equipment_select.window)) {
		global._current_equipment_select.window.closeWindow();
	}
	if (instance_exists(global._current_equipment_select.preview_inst)) {
		instance_destroy(global._current_equipment_select.preview_inst);
	}
	global._current_equipment_select.window = undefined;
	global._current_equipment_select.preview_inst = noone;
}
