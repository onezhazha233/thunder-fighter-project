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
	case 0:damage *= GetAtkPlane();break;
	case 1:damage *= GetAtkWingman();break;
	case 2:damage *= GetAtkSubweapon();break;
}