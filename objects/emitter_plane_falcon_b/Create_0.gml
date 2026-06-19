live;
event_inherited();

time_interval_idle = [1,1,1,1]
time_interval_rampage = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
}

laser_scale = 1
laser_scale_target = 1
laser_scale_level = [1.25,1.33,1.416,1.5]

damages = [0.125,0.125*1.3,0.125*1.7,0.25,0.5]

ring_time = 0

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
		audio_stop_sound(snd_plane_falcon_idle);
	}
	else{
		alarm[0] = 1;
		alarm[1] = -1;
		audio_stop_sound(snd_plane_falcon_rampage);
	}
}
SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i])){
			follow_inst[i].x = xx;
			follow_inst[i].y = yy;
			
			with(follow_inst[i]){
			if(variable_instance_exists(id,"bullet_sequence")){
				if(variable_instance_exists(id,"ll")){
					if(layer_sequence_exists(ll,bullet_sequence)){
						layer_sequence_x(bullet_sequence,x);
						layer_sequence_y(bullet_sequence,y);
					}
				}
			}
		}
		with(follow_inst[i]){
			if(variable_instance_exists(id,"seq")){
				if(variable_instance_exists(id,"ll")){
					if(layer_sequence_exists(ll,seq)){
						layer_sequence_x(seq,x);
						layer_sequence_y(seq,y);
					}
				}
			}
		}
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}