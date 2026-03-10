live;
pods = []; // 存储浮游炮实例ID
target_rotation = 90; // 默认指向正上方
current_rotation = 90;
spread_angle = 90; // 扩散角度范围
pod_radius = 120; // 阵列距离

function pod_add() {
    var new_pod = instance_create_depth(x, y, depth+10, drone);
    var mid = floor(array_length(pods) / 2);
    array_insert(pods, mid, new_pod);
}

function pod_remove() {
    if (array_length(pods) > 0) {
        var mid = floor((array_length(pods) - 1) / 2);
        instance_destroy(pods[mid]);
        array_delete(pods, mid, 1);
    }
}

image_speed = 0