live;
hspd = 1;
damage = 0.25;
a = MakePlayerBullet(x,y-30,bullet_player_wingman_gatling_rampage);
a.sprite_index = spr_bullet_player_gatling_abc_rampage;
if(dir = 0){
	a.hspeed = hspd*r*2;
	a.image_angle = -2*r;
}
else{
	a.hspeed = -hspd*r*2;
	a.image_angle = 2*r;
}
a.damage = damage;
r += 1
if(r > 3)r = 0;