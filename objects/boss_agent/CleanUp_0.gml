live;
if(instance_exists(bullet_emitter_inst))bullet_emitter_inst.Clear();
if(array_length(boss_list) = 0){
	battle_ui.boss_hpbar_enabled = false;
}
event_inherited();