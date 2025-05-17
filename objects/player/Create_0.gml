live;
touch_start_x = x;
touch_start_y = y;

equipment = instance_create_depth(x,y,0,equipment_test)

rampage_duration = 0

SetRampageDuration = function(time){
	rampage_duration = time;
	if(time > 0){
		if(equipment.state = 0){
			equipment.SetRampage(1);
		}
	}
}