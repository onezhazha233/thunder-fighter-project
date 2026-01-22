live;
if(hurt_shake_camera = true)Camera_Shake(16,16,2,2,1,1,2,2);
global.inv_hurt = hurt_inv;
if(hurt_downgrade_weapon = true)Player_SetWeaponLevel(max(0,Player_GetWeaponLevel()-1));
if(hurt_skip_recover = true)with(battle_healer)skip();

hurt_shake_camera = true
hurt_inv = 120
hurt_downgrade_weapon = true
hurt_skip_recover = true