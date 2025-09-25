live;
global.hp += heal/duration
if(global.hp >= global.hp_max){
	global.hp = global.hp_max;
	instance_destroy();
}
time += 1
if(time >= duration)instance_destroy();