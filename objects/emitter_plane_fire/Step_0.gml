live;
if(rampage = true){
	alarm[0] = -1;
}
else{
	rampage_time = 0;
	alarm[1] = -1;
}

attack_time = max(0,attack_time-1)
if(attack_time > 0){
	a = MakePlayerBullet(x,y,bullet_player_fire);
	a.rotate = sin(attack_time*1919)*3;
	a.image_angle = cos(attack_time*1919)*180;
	a.direction = 90 + sin(attack_time*1145)*(4+weapon_level*0.5);
	a.speed = 18+weapon_level;
	Anim_Create(a,"speed",0,0,a.speed,-a.speed,70);
	a.image_xscale = 0.5;
	a.image_yscale = 0.5;
	Anim_Create(a,"image_xscale",0,0,0.5,0.5,60);
	Anim_Create(a,"image_yscale",0,0,0.5,0.5,60);
	Anim_Create(a,"image_alpha",0,0,1,-1,30,30);
}