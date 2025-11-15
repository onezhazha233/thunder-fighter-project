live;
rtime += 1
number = [2,1,1,1]

tt = (rtime-1) mod 4;
damage = 1*global.atk_subweapon;

target = instance_nearest(player.x,player.y,enemy_agent);
if(instance_exists(target)){
	target_x = target.x;
	target_y = target.y;
} else {
	target = noone;
	target_x = player.x;
	target_y = 100;
}
if(number[tt] = 1){
	ang = (dir=0 ? 0 : 180)+(dir=0 ? -1 : 1)*(tt*7);
	blt = MakePlayerBullet(x,y-17,bullet_player_annihilator);
	blt.direction = ang;
	blt.image_angle = ang - 90;
	blt.speed = 10;
	blt.track_inst = target;
	blt.target_x = target_x;
	blt.target_y = target_y;
	blt.damage = damage;
	blt.rampage = true;
}
else{
	for(i=0;i<2;i+=1){
		ang = (dir=0 ? 0 : 180)+(dir=0 ? -1 : 1)*(tt*7+i*30);
		blt = MakePlayerBullet(x,y-17,bullet_player_annihilator);
		blt.direction = ang;
		blt.image_angle = ang - 90;
		blt.speed = 10;
		blt.track_inst = target;
		blt.target_x = target_x;
		blt.target_y = target_y;
		blt.damage = damage;
		blt.rampage = true;
	}
}