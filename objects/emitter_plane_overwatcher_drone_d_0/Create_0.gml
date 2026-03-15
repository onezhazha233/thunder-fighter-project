live;
event_inherited();

depth += 10;

time_interval_idle = [6,4,4,4];

damages = [0.25,0.2167,0.2125,0.2,0.2];

flame_list = [];
flame_interval = 8;
flame_timer = random(flame_interval);
flame_speed = 3;
flame_scale = 2;
flame_alpha = 1;

light_alpha = 0;
light_offset = 0;

anim_len = 20;
anim_time = 0;
var othe = instance_find(object_index,0);
if(instance_exists(othe) && othe != id){
	anim_time = othe.anim_time;
}
