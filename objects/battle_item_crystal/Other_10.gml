live;
switch(type){
	case 0:sc = 5;break;
	case 1:sc = 10;break;
	case 2:sc = 50;break;
}
Player_AddScore(sc)
audio_play_sound(snd_crystal,0,0)