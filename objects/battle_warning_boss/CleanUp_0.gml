live;
layer_destroy(ll)
if!(boss = noone){
	instance_create_depth(room_width/2,-200,0,boss);
}
if(instance_exists(warning))instance_destroy(warning);