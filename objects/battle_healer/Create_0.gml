live;
duration = 20
time = 0
heal = global.hp_max*0.3

skip = function(){
	global.hp += heal/(duration-time);
	if(global.hp >= global.hp_max)global.hp = global.hp_max;
	instance_destroy();
}