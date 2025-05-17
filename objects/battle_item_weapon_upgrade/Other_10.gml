live;
wl = player.equipment.weapon_level
if(wl = 3){
	player.SetRampageDuration(300);
	show_message(player.rampage_duration)
}
else{
	player.equipment.SetWeaponLevel(min(3,wl+1));
}