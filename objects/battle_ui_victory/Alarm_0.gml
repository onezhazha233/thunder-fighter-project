live;
BGM_SetVolume(0,0,60)
SFX_Play(snd_flyaway);
Anim_Create(player,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN,player.y,-500-player.y,60);
flyaway = 2
alarm[1] = 180