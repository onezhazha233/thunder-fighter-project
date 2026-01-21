live;
//gold shield
ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(exarg < global.hp){
			if(random(1) < 0.1){
				Player_SetWeaponLevel(max(3,Player_GetWeaponLevel()+1));
				Player_UpgradeWeapon();
			}
		}
		return exarg;
	}
}