live;
event_inherited();

if(instance_exists(track_inst)){
	num = ds_map_find_value(track_inst.tracks,object_index);
	ds_map_replace(track_inst.tracks,object_index,num-1);
}