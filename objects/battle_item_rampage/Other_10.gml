live;
if(player.rampage_duration = 0)layer_sequence_create("item_effects",x,y,seq_battle_item_effect_rampage);
player.equipment.SetWeaponLevel(3);
player.SetRampageDuration(global.rampage_duration);