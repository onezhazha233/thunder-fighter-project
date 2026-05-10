if (variable_struct_exists(self, "main_ui") && !is_undefined(main_ui) && !main_ui.is_destroyed) {
	main_ui.destroy();
}
ds_list_destroy(buff_list)