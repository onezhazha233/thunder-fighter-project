///@arg type
function Flag_GetPath() {
	var TYPE=argument[0];

	var result="./"+GAME_SAVE_NAME+"./flag/";
	switch(TYPE){
		case FLAG_STATIC:
			result+=string(Flag_GetSlot())+"/"+TYPE;
			break;
		case FLAG_SETTINGS:
			result+="settings";
			break;
		
		default:
			result="";
			break;
	}

	return result;
}