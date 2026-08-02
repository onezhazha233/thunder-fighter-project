live;
event_inherited();

for(i=0;i<5;i+=1){
	l = variable_instance_get(id,"layer_enemy_"+string(i));
	if(layer_exists(l))layer_destroy(l);
}