live;
if(!layer_sequence_exists(ll,seq)&&flyaway = 0){
	layer_destroy(ll);
	Fader_Fade(0.5,0,30);
	flyaway = 1;
	alarm[0] = 60;
}
if(flyaway = 2){
	if!(audio_is_playing(snd_flyaway)){
		flyaway = 3;
		room_goto(room_preparation);
	}
}