live;
global.hp += heal
if(global.hp >= global.hpmax){
	instance_destroy();
}
duration -= 1
if(duration <= 0)instance_destroy();