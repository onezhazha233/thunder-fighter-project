live;
if(time = 90){
	blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_0);
	blt.direction = point_direction(x,y,player.x,player.y);
	blt.speed = 5;
}