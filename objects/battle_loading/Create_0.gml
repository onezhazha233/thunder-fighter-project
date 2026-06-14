live;
depth = -100000;

phase = 0;
fade_alpha = 0;
fade_speed = 0.08;

preload_seq_list = [seq_ui_warning_boss, seq_ui_pause];
preload_spr_list = [spr_bullet_enemy_laser_blue,spr_bullet_enemy_laser_red,spr_bullet_enemy_laser_green]
preload_index = 0;
preload_active = [];
preload_layer = -1

global.battle_loading_done = false;

anim = instance_create_depth(0,0,0,battle_loading_anim)
