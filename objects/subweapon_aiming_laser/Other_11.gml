live;
blt = MakePlayerBullet(x-35*scale_x,y,bullet_player_laser)
blt.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	blt.direction = point_direction(blt.x,blt.y,enemy.x,enemy.y);
}
blt.image_angle = blt.direction - 90
blt.speed = 45
blt.track_inst = enemy
blt.rampage = true
blt.damage = damage

blt = MakePlayerBullet(x+35*scale_x,y,bullet_player_laser)
blt.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	blt.direction = point_direction(blt.x,blt.y,enemy.x,enemy.y);
}
blt.image_angle = blt.direction - 90
blt.speed = 45
blt.track_inst = enemy
blt.rampage = true
blt.damage = damage