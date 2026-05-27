///@arg type
function Flag_Save(){
	var TYPE = argument[0];
	
	with(Flag_GetStorage(TYPE)){
		var json_string = ToString();
		var path = Flag_GetPath(TYPE);
	    var file = file_text_open_write(path);
	    file_text_write_string(file,json_string);
	    file_text_close(file);
	}
}