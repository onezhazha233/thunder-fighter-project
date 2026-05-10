live;
if(variable_struct_exists(self, "main_ui") && !is_undefined(main_ui)) {
	main_ui.update();
}

for(i=0;i<ds_list_size(buff_list);i+=1){
	buff_list[|i].step();
}