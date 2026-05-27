///@arg type
///@arg name
///@arg value
function Flag_Set() {
	var TYPE=argument[0];
	var NAME=argument[1];
	var VALUE=argument[2];
	
	Flag_GetStorage(TYPE).Set(NAME,VALUE);
	return true;
}