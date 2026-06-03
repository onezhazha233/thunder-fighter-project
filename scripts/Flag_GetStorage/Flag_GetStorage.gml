///@arg name
function Flag_GetStorage(){
	var NAME = argument[0];
	
	if(!variable_global_exists("flag")){
		return undefined;
	}
	if(!is_struct(global.flag)){
		return undefined;
	}
	return global.flag[$NAME];
}