live;
if(time = 90){
	blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
	var _pgp = Player_GetPos();
	blt.direction = point_direction(x,y,_pgp[0],_pgp[1]);
	blt.speed = 5;
}