live;
switch(type){
	case 0:sc = 5;break;
	case 1:sc = 10;break;
	case 2:sc = 50;break;
}
Player_AddScore(sc)
SFX_Play(snd_crystal)
player.equipment.armor_inst.ArmorAbility(5,type);