live;
angle = -90
for(i=0;i<3;i+=1){
	blt = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_a)
	layer_sequence_angle(blt.bullet_sequence,angle-90);
	blt.dir = angle;
	blt.direction = angle;
	blt.image_angle = angle - 90;
	blt.track_inst = find_priority_enemy(bullet_player_lightning);
	blt.damage = damage;
	angle += 120;
}