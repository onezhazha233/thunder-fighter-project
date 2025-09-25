live;
Camera_Shake(8,8,2,2,1,1,2,2);
global.inv_hurt = 120;
Player_SetWeaponLevel(max(0,Player_GetWeaponLevel()-1));
with(battle_healer)skip();