live;
touch_start_x = x;
touch_start_y = y;

equipment = instance_create_depth(x,y,0,equipment_main)

rampage_duration = 0

last_item = noone//上一个拾取的道具

SetRampageDuration = function(time){
	rampage_duration = time;
	if(time > 0){
		if(equipment.state = 0){
			equipment.SetRampage(1);
		}
	}
}