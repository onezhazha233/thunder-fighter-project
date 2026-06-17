live;
event_inherited();

SetState = function(s){
	state = s;
	if(s = 0){
		SetSequence(idle_sequence,,,,true);
	}
	if(s = 1){
		SetSequence(rampage_intro);
		draw_wingman = 0;
	}
	if(s = 2){
		SetSequence(rampage);
		draw_wingman = 0;
	}
	if(s = 3){
		if(rampage_outro_mode = EQUIPMENT_RAMPAGE_OUTRO_MODE.SEQUENCE){
			SetSequence(rampage_outro);
		}
		if(rampage_outro_mode = EQUIPMENT_RAMPAGE_OUTRO_MODE.REVERSE_INTRO){
			SetSequence(rampage_intro,1,1,seqdir_left);
		}
	}
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.SetPosition(x,y);
	}
	
	if(layer_sequence_exists(layer_wingman_upper,wingman_up_sequence)){
		layer_sequence_x(wingman_up_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(wingman_up_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(wingman_up_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_up_sequence,image_yscale);
		layer_sequence_angle(wingman_up_sequence,image_angle);
		layer_sequence_blend(wingman_up_sequence,image_blend);
		layer_sequence_alpha(wingman_up_sequence,image_alpha);
	}
	if(layer_sequence_exists(layer_wingman,wingman_sequence)){
		layer_sequence_x(wingman_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(wingman_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_sequence,image_yscale);
		if(instance_exists(bullet_emitter_inst)&&variable_instance_exists(bullet_emitter_inst,"angle"))barrel_angle = bullet_emitter_inst.angle;
		layer_sequence_angle(wingman_sequence,image_angle+barrel_angle*(flip=1 ? -1 : 1)*(state==0));
		layer_sequence_blend(wingman_sequence,image_blend);
		layer_sequence_alpha(wingman_sequence,image_alpha);
	}
	if(layer_sequence_exists(layer_wingman_lower,wingman_down_sequence)){
		layer_sequence_x(wingman_down_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(wingman_down_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(wingman_down_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_down_sequence,image_yscale);
		layer_sequence_angle(wingman_down_sequence,image_angle);
		layer_sequence_blend(wingman_down_sequence,image_blend);
		layer_sequence_alpha(wingman_down_sequence,image_alpha);
	}
}

SetSequence = function(seq,spd=1,pos=0,dir=seqdir_right,upanddown=false){
	layer_sequence_destroy(wingman_up_sequence);
	layer_sequence_destroy(wingman_sequence);
	layer_sequence_destroy(wingman_down_sequence);
	wingman_sequence = layer_sequence_create(layer_wingman,x,y,seq);
	layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
	layer_sequence_yscale(wingman_sequence,image_yscale);
	layer_sequence_speedscale(wingman_sequence,spd);
	if(pos = 0)p = 0;
	if(pos = 1)p = layer_sequence_get_length(wingman_sequence);
	layer_sequence_headpos(wingman_sequence,p);
	layer_sequence_headdir(wingman_sequence,dir);
	if(upanddown = true){
		wingman_up_sequence = layer_sequence_create(layer_wingman_upper,x,y,idle_up_sequence);
		layer_sequence_xscale(wingman_up_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_up_sequence,image_yscale);
		layer_sequence_speedscale(wingman_up_sequence,spd);
		if(pos = 0)p = 0;
		if(pos = 1)p = layer_sequence_get_length(wingman_up_sequence);
		layer_sequence_headpos(wingman_up_sequence,p);
		layer_sequence_headdir(wingman_up_sequence,dir);
		
		wingman_down_sequence = layer_sequence_create(layer_wingman_lower,x,y,idle_down_sequence);
		layer_sequence_xscale(wingman_down_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_down_sequence,image_yscale);
		layer_sequence_speedscale(wingman_down_sequence,spd);
		if(pos = 0)p = 0;
		if(pos = 1)p = layer_sequence_get_length(wingman_down_sequence);
		layer_sequence_headpos(wingman_down_sequence,p);
		layer_sequence_headdir(wingman_down_sequence,dir);
	}
}