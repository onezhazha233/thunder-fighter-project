live;
wl = player.equipment.weapon_level
if(wl = 3){
	player.SetRampageDuration(300);
}
else{
	player.equipment.SetWeaponLevel(min(3,wl+1));
}