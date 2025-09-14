live;
//gold bastion
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(exarg < global.hp){
			if(random(1) <= 0.3){
				Player_SetWeaponLevel(min(3,Player_GetWeaponLevel()+1));
				Player_UpgradeWeapon();
			}
		}
	}
	return exarg;
}