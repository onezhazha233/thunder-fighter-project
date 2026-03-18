live;
layer_sequence_create(global.layer_item_effects,x,y,seq_battle_item_effect_hp_recovery);
Player_Heal(global.hp_max*0.3)
Player_SetLastItem([object_index,layer_sequence_exists(ll_fx,effect_sequence)])
audio_play_sound(snd_hp_recovery,0,0)