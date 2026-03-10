live;
event_inherited();

drones = []; // 存储浮游炮实例ID
drones_wl = [2,2,3,4]
target_rotation = 90; // 默认指向正上�?
current_rotation = 90;
spread_angle = 20; // 扩散角度范围
spread_angles = [20,20,40,56]
drone_radius = 115; // 阵列距离

wlp = weapon_level
detect_angle = 50
detect_range = 2000
detect_step = 5
rotate_spd = 2

function drone_add() {
    var new_drone = instance_create_depth(x, y, depth+10, emitter_plane_overwatcher_drone_a);
    var mid = floor(array_length(drones) / 2);
    array_insert(drones, mid, new_drone);
}

function drone_remove() {
    if (array_length(drones) > 0) {
        var mid = floor((array_length(drones) - 1) / 2);
        instance_destroy(drones[mid]);
        array_delete(drones, mid, 1);
    }
}

