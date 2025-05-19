live;
wl = player.equipment.weapon_level
if(wl = 3){
	if(player.rampage_duration = 0)layer_sequence_create("item_effects",x,y,seq_battle_item_effect_rampage);
	player.SetRampageDuration(global.rampage_duration);
}
else{
	layer_sequence_create("item_effects",x,y,seq_battle_item_effect_weapon_upgrade);
	player.equipment.SetWeaponLevel(min(3,wl+1));
}