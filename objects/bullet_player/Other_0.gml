if(auto_destroy = 1){
	auto_destroy_delay -= 1;
	if(auto_destroy_delay <= 0){
		instance_destroy();
	}
}