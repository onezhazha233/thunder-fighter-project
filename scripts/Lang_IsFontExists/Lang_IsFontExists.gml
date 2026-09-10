///@arg font_name
function Lang_IsFontExists(KEY) {
	var VALUE=ds_map_find_value(global._gmu_lang_font,KEY);
	if(is_string(VALUE)){
		VALUE=real(VALUE);
	}
	// 兼容新旧运行时：旧版字体ID为 real，2024.13+ 为 handle(int64)
	return font_exists((is_real(VALUE)||is_handle(VALUE)) ? VALUE : -1);
}