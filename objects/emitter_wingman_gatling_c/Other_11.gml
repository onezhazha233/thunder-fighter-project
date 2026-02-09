live;
hspd = 1;
blt = MakePlayerBullet(x,y-30,bullet_player_wingman_gatling_rampage);
blt.sprite_index = spr_bullet_player_gatling_abc_rampage;
if(dir = 0){
	blt.hspeed = hspd*r*2;
	blt.image_angle = -2*r;
}
else{
	blt.hspeed = -hspd*r*2;
	blt.image_angle = 2*r;
}
blt.damage = damage;
r += 1
if(r > 3)r = 0;