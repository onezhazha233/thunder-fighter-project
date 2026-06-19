live;
for(i=0;i<array_length(global.player_bullet_sfx);i+=1){
	audio_stop_sound(global.player_bullet_sfx[i]);
}
room_goto(room_preparation);