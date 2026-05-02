live;
for(i=0;i<1;i+=1){
	if!(instance_exists(ball[i])){
		ball[i] = instance_create_depth(x,y,depth,bullet_player_wingman_mega_ball);
		ball[i].bullet_sequence = layer_sequence_create(ball[i].ll,x,y,seq_bullet_player_mega_b_ball);
		layer_sequence_xscale(ball[i].bullet_sequence,scale_x);
		layer_sequence_yscale(ball[i].bullet_sequence,scale_y);
		ball[i].image_xscale = scale_x;
		ball[i].image_yscale = scale_y;
		layer_sequence_speedscale(ball[i].bullet_sequence,game_get_speed(gamespeed_fps)/60);
		ball[i].image_angle = 36*i;
		array_push(follow_inst,[ball[i],0]);
		alarm[2] = 6;
	}
}