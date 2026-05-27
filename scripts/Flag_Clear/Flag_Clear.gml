///@arg type
function Flag_Clear() {
	var TYPE=argument[0];

	Flag_GetStorage(TYPE).Clear();
}