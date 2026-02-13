live;
event_inherited();

if(instance_exists(track_inst)){
	if(ds_exists(track_inst.tracks,ds_type_map)&&ds_map_exists(track_inst.tracks,object_index)){
		num = ds_map_find_value(track_inst.tracks,object_index);
		ds_map_replace(track_inst.tracks,object_index,num-1);
	}
}