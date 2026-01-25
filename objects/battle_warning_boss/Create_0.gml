live;
ll = layer_create(DEPTH_BATTLE.UI)
warning = layer_sequence_create(ll,room_width/2,560,seq_ui_warning_boss)
warning_text = instance_create_depth(room_width/2,560-168,DEPTH_BATTLE.UI,battle_warning_boss_textbar)
boss = noone
lv = 1
name = "testname"

audio_play_sound(snd_warning_boss,0,0)

BGM_SetVolume(0,0,20)
alarm[0] = 20