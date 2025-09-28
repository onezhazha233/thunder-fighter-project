live;
if(rampage = true){
	alarm[0] = -1;
}
else{
	rampage_time = 0;
	alarm[1] = -1;
}

damage = 0.201;
switch(weapon_level){
	case 0:damage = 0.201*global.atk_plane;break;
	case 1:damage = 0.2464*global.atk_plane;break;
	case 2:damage = 0.3029*global.atk_plane;break;
	case 3:damage = 0.3333*global.atk_plane;break;
}

if(enabled = true){
	if(rampage = false){
		attack_time = max(0,attack_time-1);
		if(attack_time > 0){
			a = MakePlayerBullet(x,y,bullet_player_plane_fire);
			a.rotate = sin(attack_time*1919)*3;
			a.image_angle = cos(attack_time*1919)*180;
			a.direction = 90 + sin(attack_time*1145)*(4+weapon_level*0.5);
			a.speed = 18+weapon_level;
			Anim_Create(a,"speed",0,0,a.speed,-a.speed,70);
			a.image_xscale = 0.5;
			a.image_yscale = 0.5;
			a.damage = damage;
			Anim_Create(a,"image_xscale",0,0,0.5,0.5,60);
			Anim_Create(a,"image_yscale",0,0,0.5,0.5,60);
			Anim_Create(a,"image_alpha",0,0,1,-1,30,30);
		}
	}
	else{
		attack_time = 0;
	}
}