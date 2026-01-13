live;
touch_start_x = x;
touch_start_y = y;

equipment = instance_create_depth(x,y,0,equipment_main)

rampage_duration = 0

last_item = noone//上一个拾取的道具

graze_enabled = false
graze_time = 0
graze_radius = 60
graze_list = ds_list_create()
graze_effects = [];

effect_life_max = 20; // 寿命(帧)
effect_spd_min = 4;   // 最小扩散速度
effect_spd_max = 7;   // 最大扩散速度

SetRampageDuration = function(time){
	rampage_duration = time;
	if(time > 0){
		if(equipment.state = 0){
			equipment.SetRampage(1);
		}
	}
}