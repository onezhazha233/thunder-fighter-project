live;
ll = layer_create(DEPTH_BATTLE.UI-100)
seq = layer_sequence_create(ll,room_width/2,560,seq_ui_victory)
layer_sequence_xscale(seq,1.2)
layer_sequence_yscale(seq,1.2)
audio_play_sound(snd_victory,0,0)
Fader_Fade(0,0.5,20)
player.moveable = false;

flyaway = 0