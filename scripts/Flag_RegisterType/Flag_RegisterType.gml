///@arg type
///@arg content
function Flag_RegisterType(){
	var TYPE = argument[0];
	var CONTENT = argument[1];
	
	global.flag[$TYPE] = CONTENT;
}