live;
event_inherited();

spread_angle += (spread_angles[weapon_level] - spread_angle)/2

// Keep drone count synced to drones_wl[weapon_level].
var target_drone_count = drones_wl[weapon_level];
var current_drone_count = array_length(drones);
if (current_drone_count < target_drone_count) {
	repeat(target_drone_count - current_drone_count) {
		drone_add();
	}
} else if (current_drone_count > target_drone_count) {
	repeat(current_drone_count - target_drone_count) {
		drone_remove();
	}
}
wlp = weapon_level;

// Sweep small angles with laser_find_width to find the nearest enemy in the forward cone.
var nearest_enemy = noone;
var nearest_dist = 2000;
var cone_half = detect_angle / 2;
var start_ang = 90 - cone_half;
var end_ang = 90 + cone_half;

for (var ang = start_ang; ang <= end_ang; ang += detect_step) {
	var hits = laser_find_width(x, y, ang, detect_range, 1, enemy_agent, true, true);
	if (array_length(hits) > 0) {
		// laser_find_width returns [instance, distance] sorted by distance.
		var inst = hits[0][0];
		var dist = hits[0][1];
		if (instance_exists(inst) && dist < nearest_dist) {
			nearest_dist = dist;
			nearest_enemy = inst;
		}
	}
}

if (nearest_enemy != noone) {
	target_rotation = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
} else {
	target_rotation = 90;
}

if(angle_difference(target_rotation,current_rotation) > rotate_spd){
	current_rotation += sign(angle_difference(target_rotation,current_rotation))*rotate_spd;
}
else{
	current_rotation = target_rotation;
}

// 2. 更新浮游炮的目标位置
var count = array_length(drones);
for (var i = 0; i < count; i++) {
    if (instance_exists(drones[i])) {
        // 计算阵列角度: 中心偏移�?(i - (n-1)/2)
        var offset = (i - (count - 1) / 2) * (spread_angle / max(1, count - 1));
        var final_angle = current_rotation + offset;
        
        drones[i].x = x + lengthdir_x(drone_radius, final_angle);
        drones[i].y = y + lengthdir_y(drone_radius, final_angle);
		drones[i].image_angle = current_rotation-90;
		drones[i].enabled = enabled;
		drones[i].weapon_level = weapon_level;
		drones[i].rampage = rampage;
    }
}
