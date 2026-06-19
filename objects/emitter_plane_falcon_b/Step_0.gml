live;
event_inherited();

if(enabled = false){
	for(i=0;i<array_length(laser);i+=1){
		if(instance_exists(laser[i])){
			instance_destroy(laser[i]);
		}
	}
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i])){
			instance_destroy(follow_inst[i]);
		}
	}
	alarm[2] = -1;
	alarm[3] = -1;
	if(audio_is_playing(snd_plane_falcon_idle))audio_stop_sound(snd_plane_falcon_idle);
	if(audio_is_playing(snd_plane_falcon_rampage))audio_stop_sound(snd_plane_falcon_rampage);
}

if(abs(laser_scale - laser_scale_target) > 0.01){
	laser_scale += (laser_scale_target - laser_scale)/5;
}
else{
	laser_scale = laser_scale_target;
}