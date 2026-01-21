live;
//moonlight armor
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		return exarg;
	}
	if(type = 3){
		if(random(1) < 0.2){
			Player_SetShield(global.quantum_shield_duration);
			Player_SetLastItem(self);
			audio_play_sound(snd_quantum_shield_intro,0,0);
		}
	}
}