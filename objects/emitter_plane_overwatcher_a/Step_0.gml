live;
event_inherited();

var target_spread_angle;
if(rampage){
	target_spread_angle = spread_angles[array_length(spread_angles) - 1];
} else {
	target_spread_angle = spread_angles[weapon_level];
}
spread_angle += (target_spread_angle - spread_angle)/2

// Keep drone count synced to drones_wl based on rampage state.
var target_drone_count;
if(rampage){
	target_drone_count = drones_wl[array_length(drones_wl) - 1];
} else {
	target_drone_count = drones_wl[weapon_level];
}
var current_drone_count = array_length(drones);
if(current_drone_count < target_drone_count){
	repeat(target_drone_count - current_drone_count){
		drone_add();
	}
} else if(current_drone_count > target_drone_count){
	repeat(current_drone_count - target_drone_count){
		drone_remove();
	}
}
wlp = weapon_level;

// Update drone_1 positions and rotation.
for (var i = array_length(drones_1) - 1; i >= 0; i--){
	var d = drones_1[i];
	if(!instance_exists(d)){
		array_delete(drones_1,i,1);
		continue;
	}
	
	if(!d.returning){
		d.offset_x += (d.target_offset_x-d.offset_x)/3;
		d.offset_y += (d.target_offset_y-d.offset_y)/3;
	}
	var target_d_x = x + d.offset_x;
	var target_d_y = y + d.offset_y;
	d.x += (target_d_x-d.x)/3;
	d.y += (target_d_y-d.y)/3;
	d.rampage = rampage;
	d.enabled = enabled;
	
	if(!enabled){
		var diff = angle_difference(d.default_angle-90,d.image_angle);
		d.image_angle += clamp(diff,-drone_1_rotate_spd,drone_1_rotate_spd);
	} else {
		if(d.index == 0){
			d.swing_time += 1;
			var swing_t = d.swing_time mod drone_1_swing_duration;
			if(swing_t <= drone_1_swing_duration/2){
				var t = swing_t/(drone_1_swing_duration/2);
				d.image_angle = lerp(d.swing_min,d.swing_max,t)-90;
			} else {
				var t = (swing_t - drone_1_swing_duration/2)/(drone_1_swing_duration/2);
				d.image_angle = lerp(d.swing_max,d.swing_min,t)-90;
			}
		} else {
			d.image_angle = d.default_angle-90;
		}
	}
	
	if(d.returning && abs(d.offset_x) < 0.5 && abs(d.offset_y) < 0.5){
		instance_destroy(d);
		array_delete(drones_1,i,1);
		continue;
	}
}
if(array_length(drones_1) == 0){
	drones_1_returning = false;
}

// Re-sequence drone_2 firing timers when enabled toggles false -> true.
if(!enabled_prev && enabled){
	var total = array_length(drones_2);
	for(var i = 0; i < total; i++){
		var d = drones_2[i];
		if(instance_exists(d)){
			d.alarm[1] = 1+(9*d.fire_index) mod 45;
		}
	}
}
enabled_prev = enabled;
// Sweep small angles with laser_find_width to find the nearest enemy in the forward cone.
var nearest_enemy = noone;
var nearest_dist = 2000;
var cone_half = detect_angle / 2;
var start_ang = 90 - cone_half;
var end_ang = 90 + cone_half;

for (var ang = start_ang; ang <= end_ang; ang += detect_step){
	var hits = laser_find_width(x,y,ang,detect_range,1,enemy_agent,true,true);
	if(array_length(hits) > 0){
		// laser_find_width returns [instance,distance] sorted by distance.
		var inst = hits[0][0];
		var dist = hits[0][1];
		if(instance_exists(inst) && dist < nearest_dist){
			nearest_dist = dist;
			nearest_enemy = inst;
		}
	}
}

// Update drone_2 positions and rotation.
for (var i = array_length(drones_2) - 1; i >= 0; i--){
	var d = drones_2[i];
	if(!instance_exists(d)){
		array_delete(drones_2,i,1);
		continue;
	}
	
	if(!d.returning){
		d.offset_x += (d.target_offset_x-d.offset_x)/3;
		d.offset_y += (d.target_offset_y-d.offset_y)/3;
	}
	var target_d_x = x + d.offset_x;
	var target_d_y = y + d.offset_y;
	d.x += (target_d_x-d.x)/3;
	d.y += (target_d_y-d.y)/3;
	d.SetPosition(d.x,d.y);
	d.rampage = rampage;
	d.enabled = enabled;
	
	var desired_angle = 90;
	if(enabled && instance_exists(nearest_enemy)){
		desired_angle = point_direction(d.x,d.y,nearest_enemy.x,nearest_enemy.y);
	}
	var diff = angle_difference(desired_angle-90,d.image_angle);
	d.image_angle += clamp(diff,-drone_2_rotate_spd,drone_2_rotate_spd);
	
	if(d.returning && abs(d.offset_x) < 0.5 && abs(d.offset_y) < 0.5){
		instance_destroy(d);
		array_delete(drones_2,i,1);
		continue;
	}
}
if(array_length(drones_2) == 0){
	drones_2_returning = false;
}

if(nearest_enemy != noone){
	target_rotation = point_direction(x,y,nearest_enemy.x,nearest_enemy.y);
} else {
	target_rotation = 90;
}

target_rotation = clamp(target_rotation,90-detect_angle/2,90+detect_angle/2);

if(abs(angle_difference(target_rotation,current_rotation)) > rotate_spd){
	current_rotation += sign(angle_difference(target_rotation,current_rotation))*rotate_spd;
} else {
	current_rotation = target_rotation;
}

// 2. 更新浮游炮的目标位置
var count = array_length(drones);
for (var i = 0; i < count; i++){
	if(instance_exists(drones[i])){
		// 计算阵列角度: 中心偏移�?(i - (n-1)/2)
		var offset = (i - (count - 1) / 2) * (spread_angle / max(1,count - 1));
		var final_angle = current_rotation + offset;
		
		var target_x = x + lengthdir_x(drone_radius,final_angle);
		var target_y = y + lengthdir_y(drone_radius,final_angle);
		drones[i].x += (target_x-drones[i].x)/3;
		drones[i].y += (target_y-drones[i].y)/3;
		drones[i].image_angle = current_rotation-90;
		drones[i].enabled = enabled;
		drones[i].weapon_level = weapon_level;
		drones[i].rampage = rampage;
	}
}


