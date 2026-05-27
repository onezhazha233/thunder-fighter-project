///@arg type
///@arg name
///@arg default*
function Flag_Get(){
	var TYPE=argument[0];
	var NAME=argument[1];
	var DEFAULT=0;
	if(argument_count>=3){
		DEFAULT=argument[2];
	}
	
	return Flag_GetStorage(TYPE).Get(NAME,DEFAULT);
}