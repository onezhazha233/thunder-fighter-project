function Equipment_GetName(obj){
	obj_name = object_get_name(obj);
	var true_name = obj_name;
	var _underline_pos = string_pos("_", obj_name);
	if (_underline_pos > 0) {
		true_name = string_copy(obj_name, _underline_pos + 1, string_length(obj_name) - _underline_pos);
		var _variant_pos = string_last_pos("_", true_name);
		if (_variant_pos > 0) {
			true_name = string_copy(true_name, 1, _variant_pos - 1) + "." + string_copy(true_name, _variant_pos + 1, string_length(true_name) - _variant_pos);
		}
	}
	return ((Lang_IsStringExists(true_name) ? Lang_GetString(true_name) : true_name));
}
