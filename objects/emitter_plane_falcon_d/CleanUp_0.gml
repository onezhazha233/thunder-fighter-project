live;
for(i=0;i<array_length(laser);i+=1){
	if(instance_exists(laser[i])){
		instance_destroy(laser[i]);
	}
}
follow_inst = [];
if(audio_is_playing(snd_plane_falcon_idle))audio_stop_sound(snd_plane_falcon_idle);
if(audio_is_playing(snd_plane_falcon_rampage))audio_stop_sound(snd_plane_falcon_rampage);