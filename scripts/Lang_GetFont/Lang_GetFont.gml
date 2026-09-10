///@arg font_name
///@arg default*
function Lang_GetFont(KEY, DEF=-1){
	if(!font_exists(DEF)&&DEF!=-1){
		DEF=-1;
	}
	if(!Lang_IsFontExists(KEY)){
		return DEF;
	}
	var VALUE=ds_map_find_value(global._gmu_lang_font,KEY);
	if(is_string(VALUE)){
		VALUE=real(VALUE);
	}
	// 兼容新旧运行时：旧版返回 real，2024.13+ 返回 handle(int64)
	return (is_real(VALUE)||is_handle(VALUE)) ? VALUE : DEF;
}