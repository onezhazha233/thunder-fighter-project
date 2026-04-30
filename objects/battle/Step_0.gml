live;
if (battle_initialized) exit;

if (!instance_exists(battle_loading) || !variable_global_exists("battle_loading_done") || global.battle_loading_done) {
	battle_initialized = true;

	player_inst = instance_create_depth(room_width/2,1400,0,player)
	Anim_Create(player_inst,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,player_inst.y,860-player_inst.y,20)
	global.inv_hurt = 100
	alarm[0] = 2
	alarm[1] = 100
	global.lui_interact_enabled = true;
}
