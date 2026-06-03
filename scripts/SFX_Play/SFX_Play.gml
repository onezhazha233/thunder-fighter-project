function SFX_Play(soundid,priority=0,loops=0){
	if(Flag_Get(FLAG_SETTINGS,"sound") = false)return;
	if(room != room_battle && array_contains(global.player_bullet_sfx,soundid)){
		return;
	}
	return audio_play_sound(soundid,priority,loops);
}