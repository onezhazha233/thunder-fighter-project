live;
depth = -100000;

phase = 0;
fade_alpha = 0;
fade_speed = 0.08;

preload_list = [seq_ui_warning_boss, seq_ui_pause];
preload_index = 0;
preload_active = [];
preload_layer = layer_create(0)

global.battle_loading_done = false;
global.lui_interact_enabled = false;

anim = instance_create_depth(0,0,depth,battle_loading_anim)
