live;
event_inherited();

drones = [];//存储浮游炮实例ID
drones_wl = [3,3,4,5]
target_rotation = 90;//默认指向正上�?
current_rotation = 90;
spread_angle = 20;//扩散角度范围
spread_angles = [40,40,56,72]
drone_radius = 115;//阵列距离

wlp = weapon_level
detect_angle = 50
detect_angles = [50,100]
detect_range = 2000
detect_step = 5
rotate_spd = 2

// drone_1 setup (rampage mode 0)
drone_1_number = 3
drones_1 = []
drones_1_returning = false
drone_1_entering = false
drone_1_move_time = 30
drone_1_swing_duration = 180
drone_1_rotate_spd = 2

// drone_2 setup (rampage mode 1)
drone_2_number = 3
drones_2 = []
drones_2_returning = false
drone_2_entering = false
drone_2_move_time = 30
drone_2_rotate_spd = 3
enabled_prev = enabled
rampage_mode = 0

function sync_drone_alarms(){
	for(var i = 0; i < array_length(drones); i++){
		if(instance_exists(drones[i])){
			drones[i].alarm[0] = drones[0].alarm[0];
			drones[i].alarm[1] = drones[0].alarm[1];
		}
	}
}

function clear_group(arr){
	for(var i = array_length(arr) - 1; i >= 0; i--){
		if(instance_exists(arr[i])){
			instance_destroy(arr[i]);
		}
	}
	return [];
}

function start_return_group(arr,move_time){
	for(var i = 0; i < array_length(arr); i++){
		var inst = arr[i];
		if(instance_exists(inst)){
			inst.returning = true;
			Anim_Create(inst,"depth",0,0,inst.depth,20,5);
			Anim_Create(inst,"offset_x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,inst.offset_x,-inst.offset_x,move_time);
			Anim_Create(inst,"offset_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,inst.offset_y,-inst.offset_y,move_time);
		}
	}
}

function init_drone_base(inst,dir,i,off_x,off_y,base_angle){
	inst.offset_x = 0;
	inst.offset_y = 0;
	inst.side = dir;
	inst.index = i;
	inst.returning = false;
	inst.target_offset_x = off_x;
	inst.target_offset_y = off_y;
	if(dir == -1) base_angle = 180 - base_angle;
	inst.default_angle = base_angle;
	inst.image_angle = base_angle-90;
}

function drone_add(){
	var new_drone = instance_create_depth(x,y,depth+10,emitter_plane_overwatcher_drone_d_0);
	var mid = floor(array_length(drones) / 2);
	array_insert(drones,mid,new_drone);
	sync_drone_alarms();
}

function drone_remove(){
	if(array_length(drones) > 0){
		var mid = floor((array_length(drones) - 1) / 2);
		instance_destroy(drones[mid]);
		array_delete(drones,mid,1);
	}
	sync_drone_alarms();
}

function drone_1_clear(){
	drones_1 = clear_group(drones_1);
	drones_1_returning = false;
	drone_1_entering = false;
}

function drone_1_setup_swing(inst,dir,i){
	if(i == 0){
		if(dir == 1){
			inst.swing_min = 70;
			inst.swing_max = 90;
		} else {
			inst.swing_min = 90;
			inst.swing_max = 110;
		}
		inst.swing_time = (abs(inst.default_angle - inst.swing_max) < abs(inst.default_angle - inst.swing_min) ? drone_1_swing_duration/2 : 0);
	} else if(i == 2){
		if(dir == 1){
			inst.swing_min = 70;
			inst.swing_max = 90;
		} else {
			inst.swing_min = 110;
			inst.swing_max = 90;
		}
		inst.swing_time = (abs(inst.default_angle - inst.swing_max) < abs(inst.default_angle - inst.swing_min) ? drone_1_swing_duration/2 : 0);
	}
	else{
		inst.swing_min = inst.default_angle;
		inst.swing_max = inst.default_angle;
		inst.swing_time = 0;
	}
}

function drone_1_create(){
	drone_1_clear();
	drones_1_returning = false;
	drone_1_entering = true;
	for(var side = 0; side < 2; side++){
		var dir = (side == 0 ? 1 : -1);
		for(var i = 0; i < drone_1_number; i++){
			var inst = instance_create_depth(x,y,depth+10,emitter_plane_overwatcher_drone_d_1);
			var off_x = (115 + i*40) * dir;
			var off_y = -110 + i*22;
			var base_angle = (i == 0 ? 90 : 80);
			init_drone_base(inst,dir,i,off_x,off_y,base_angle);
			inst.alarm[1] = 1;
			drone_1_setup_swing(inst,dir,i);
			array_push(drones_1,inst);
			Anim_Create(inst,"depth",0,0,inst.depth,-20,5);
		}
	}
}

function drone_1_start_return(){
	drones_1_returning = true;
	drone_1_entering = false;
	start_return_group(drones_1,drone_1_move_time);
}

function drone_2_clear(){
	drones_2 = clear_group(drones_2);
	drones_2_returning = false;
	drone_2_entering = false;
}

function drone_2_create(){
	drone_2_clear();
	drones_2_returning = false;
	drone_2_entering = true;
	for(var side = 0; side < 2; side++){
		var dir = (side == 0 ? 1 : -1);
		for(var i = 0; i < drone_2_number; i++){
			var inst = instance_create_depth(x,y,depth+10,emitter_plane_overwatcher_drone_d_2);
			var off_x = (115 + i*55) * dir;
			var off_y = -110 + i*35;
			init_drone_base(inst,dir,i,off_x,off_y,90);
			var fire_index = (dir == -1 ? (drone_2_number-1-i) : (drone_2_number+i));
			inst.fire_index = fire_index;
			inst.alarm[1] = 30+(9*fire_index) mod 45;
			Anim_Create(inst,"depth",0,0,inst.depth,-20,5);
			array_push(drones_2,inst);
		}
	}
}

function drone_2_start_return(){
	drones_2_returning = true;
	drone_2_entering = false;
	start_return_group(drones_2,drone_2_move_time);
}

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage == true){
		for(var i = 0; i < array_length(drones); i++){
			if(instance_exists(drones[i])){
				drones[i].alarm[0] = -1;
				drones[i].alarm[1] = 1;
			}
		}
		if(rampage_mode = 0){
			if(drones_1_returning || array_length(drones_1) > 0){
				drone_1_clear();
			}
			drone_1_create();
		}
		if(rampage_mode = 1){
			if(drones_2_returning || array_length(drones_2) > 0){
				drone_2_clear();
			}
			drone_2_create();
		}
	}
	else{
		for(var i = 0; i < array_length(drones); i++){
			if(instance_exists(drones[i])){
				drones[i].alarm[0] = 1;
				drones[i].alarm[1] = -1;
			}
		}
		if(array_length(drones_1) > 0 && !drones_1_returning){
			drone_1_start_return();
		}
		if(array_length(drones_2) > 0 && !drones_2_returning){
			drone_2_start_return();
		}
	}
}
