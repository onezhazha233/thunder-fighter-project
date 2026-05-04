if (variable_struct_exists(self, "main_ui") && !is_undefined(main_ui)) {
	main_ui.render();
}

if(variable_instance_exists(id,"list"))
if!(list = -1)draw_text(0,0,list.scroll_target_offset_y)