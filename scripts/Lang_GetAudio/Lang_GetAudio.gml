///@arg audio_name
///@arg default*
function Lang_GetAudio(KEY, DEF=-1) {
	if(!audio_exists(DEF)&&DEF!=-1){
		DEF=-1;
	}
	return (Lang_IsAudioExists(KEY) ? ds_map_find_value(global._gmu_lang_audio,KEY) : DEF);
}