live;
damage = 5.167/6*3*global.atk_subweapon

if(bb = false){
	angle = 0;
}
else{
	angle = 90;
}
bb = !bb

for(i=0;i<6;i+=1){
	a = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_cd);
	layer_sequence_angle(a.bullet_sequence,angle-90);
	a.collision_effect_sequence = seq_lightning_cd_explosion;
	a.dir = angle;
	a.direction = angle;
	a.image_angle = angle - 90;
	a.speed += 3;
	a.track_inst = find_priority_enemy(bullet_player_lightning);
	a.damage = damage;
	a.rampage = true;
	angle += 60;
}