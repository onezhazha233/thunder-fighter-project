live;
global.hp += heal/duration
if(global.hp >= global.hpmax){
	instance_destroy();
}
time += 1
if(time >= duration)instance_destroy();