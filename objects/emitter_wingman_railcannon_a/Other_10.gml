live;
a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
a.sprite_index = spr_bullet_player_railcannon_a
if(dir = 0){
	a.image_angle += 17;
}
else{
	a.image_angle -= 17;
}
a.direction = a.image_angle + 90
a.speed = 45
a.damage = damage