live;
global.inv_cutscene = 1
player.equipment.SetEnabled(false)

if!(layer_sequence_exists(ll,warning)){
	instance_destroy();
}
if(instance_exists(warning_text)){
	warning_text.lv = lv;
	warning_text.name = name;
}