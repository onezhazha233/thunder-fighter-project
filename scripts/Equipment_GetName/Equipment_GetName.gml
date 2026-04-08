function Equipment_GetName(obj){
	obj_name = object_get_name(obj);
	var true_name = obj_name;
	var _underline_pos = string_pos("_", obj_name);
	if (_underline_pos > 0) {
		true_name = string_delete(obj_name, 1, _underline_pos);
	}
	return ((Lang_IsStringExists(true_name) ? Lang_GetString(true_name) : true_name));
}