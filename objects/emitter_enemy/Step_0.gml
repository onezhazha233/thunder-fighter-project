live;
if(enabled = true)time += 1;
if(time >= duration){
	time = 0;
	if(loop = false){
		enabled = false;
	}
}