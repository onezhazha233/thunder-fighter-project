live;
switch(weapon_level){
	case 0:damage = 9.375/21;break;
	case 1:damage = 9.75/21;break;
	case 2:damage = 9.5625/21;break;
	case 3:damage = 7.5/21;break;
}

for(i=0;i<1;i+=1){
	if!(instance_exists(ball[i])){
		ball[i] = instance_create_depth(x,y,depth,bullet_player_wingman_mega_ball);
		ball[i].bullet_sequence = layer_sequence_create(ball[i].ll,x,y,seq_bullet_player_mega_a_ball);
		layer_sequence_speedscale(ball[i].bullet_sequence,game_get_speed(gamespeed_fps)/60);
		ball[i].image_angle = 36*i;
		array_push(follow_inst,ball[i]);
		alarm[2] = 6;
	}
}