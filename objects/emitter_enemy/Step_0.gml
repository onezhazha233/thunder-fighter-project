live;
if(enabled = true){
	time += 1;
	event_user(0);
}
if(time >= duration){
	if(loop = true){
		time = 0;
	}
}