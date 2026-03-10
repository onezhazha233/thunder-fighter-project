live;
// 0. 键盘控制：按Q增加浮游炮，按W减少浮游炮
if (keyboard_check_pressed(ord("Q"))) {
    pod_add();
}
if (keyboard_check_pressed(ord("W"))) {
    pod_remove();
}

// 1. 旋转控制
if (mouse_check_button(mb_left)) {
    var target_angle = point_direction(x, y, mouse_x, mouse_y);
    target_rotation = target_angle;
}

//current_rotation = lerp(current_rotation, target_rotation, 0.1);
current_rotation += angle_difference(target_rotation,current_rotation)*0.5

// 2. 更新浮游炮的目标位置
var count = array_length(pods);
for (var i = 0; i < count; i++) {
    if (instance_exists(pods[i])) {
        // 计算阵列角度: 中心偏移量 (i - (n-1)/2)
        var offset = (i - (count - 1) / 2) * (spread_angle / max(1, count - 1));
        var final_angle = current_rotation + offset;
        
        pods[i].target_x = x + lengthdir_x(pod_radius, final_angle);
        pods[i].target_y = y + lengthdir_y(pod_radius, final_angle);
		pods[i].image_angle = current_rotation-90;
    }
}