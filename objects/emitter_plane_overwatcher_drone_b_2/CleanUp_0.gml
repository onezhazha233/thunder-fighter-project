live;
for(i=0;i<array_length(follow_inst);i+=1){
	if(instance_exists(follow_inst[i,0])){
		instance_destroy(follow_inst[i,0]);
	}
}