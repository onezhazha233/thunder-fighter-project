live;
if(bb = false){
	angle = 0;
}
else{
	angle = 45;
}
bb = !bb

for(i=0;i<4;i+=1){
	a = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_b);
	layer_sequence_angle(a.bullet_sequence,angle-90);
	a.collision_effect_sequence = seq_lightning_b_explosion;
	a.dir = angle;
	a.direction = angle;
	a.image_angle = angle - 90;
	a.speed += 3;
	a.track_inst = find_priority_enemy(bullet_player_lightning);
	a.damage = damage;
	a.rampage = true;
	angle += 90;
}