live;
for(i=0;i<4;i+=1){
	nl = instance_create_depth(0,0,0,bullet_enemy_laser_piano_node_laser);
	if(i < 3){
		nl.node_0 = n[i];
		nl.node_1 = n[i+1];
	}
	else{
		nl.node_0 = n[i];
		nl.node_1 = n[0];
	}
}