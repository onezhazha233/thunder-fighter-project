live;
event_inherited();

time_interval_idle = [60*2.5,60*2,60*1.5,60]
time_interval_rampage = 1

scale_x = 1
scale_y = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
	ball[i] = noone;
}

fire = noone

damage = 1