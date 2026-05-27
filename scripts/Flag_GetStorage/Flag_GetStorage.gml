///@arg name
function Flag_GetStorage(){
	var NAME = argument[0];
	
	return global.flag[$NAME];
}