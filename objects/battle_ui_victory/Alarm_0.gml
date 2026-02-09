live;
BGM_SetVolume(0,0,60)
audio_play_sound(snd_flyaway,0,0);
Anim_Create(player,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN,player.y,-200-player.y,50);
flyaway = 2