live;
event_inherited();

vspeed = -20/3

if(time >= 10){
	MakeEffect(x,y+(-30+(time mod 5)*12)*scale_y,ef,scale_x,scale_y);
	time = 0;
}
time += 0.5;