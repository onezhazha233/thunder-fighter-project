live;
if(bb = false){
	angle = -90;
}
else{
	angle = 90;
}
bb = !bb

for(i=0;i<5;i+=1){
	blt = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_cd);
	layer_sequence_angle(blt.bullet_sequence,angle-90);
	blt.collision_effect_sequence = seq_lightning_cd_explosion;
	blt.dir = angle;
	blt.direction = angle;
	blt.image_angle = angle - 90;
	blt.speed += 3;
	blt.track_inst = find_priority_enemy(bullet_player_lightning);
	blt.damage = damage;
	blt.rampage = true;
	angle += 72;
}