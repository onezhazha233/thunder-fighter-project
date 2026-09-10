///@arg group
function Lang_BindTyperGroup(GROUP) {
	var TYPER_OBJ=Lang_GetTyper(string(GROUP));
	if(!is_struct(TYPER_OBJ)){
		return false;
	}

	var FONT_ASCII=Lang_GetTyperFont(GROUP,"ascii",-1);
	if(font_exists(FONT_ASCII)){
		GROUP.typer_ascii_font=FONT_ASCII;
	}

	var FONT_UNI=Lang_GetTyperFont(GROUP,"uni",-1);
	if(font_exists(FONT_UNI)){
		GROUP.typer_uni_font=FONT_UNI;
	}

	if(variable_struct_exists(TYPER_OBJ,"scale")){
		GROUP.typer_scale=variable_struct_get(TYPER_OBJ,"scale");
	}
	if(variable_struct_exists(TYPER_OBJ,"spacing")){
		GROUP.typer_spacing=variable_struct_get(TYPER_OBJ,"spacing");
	}
	if(variable_struct_exists(TYPER_OBJ,"line_height")){
		GROUP.typer_line_height=variable_struct_get(TYPER_OBJ,"line_height");
	}

	return true;
}