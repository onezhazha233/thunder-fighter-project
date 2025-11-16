live;
if(rampage = true){
	alarm[0] = -1;
	damage = damages[4];
}
else{
	alarm[1] = -1;
	damage = damages[weapon_level];
}
switch(type){
	case 0:damage *= global.atk_plane;break;
	case 1:damage *= global.atk_wingman;break;
	case 2:damage *= global.atk_subweapon;break;
}