live;
// 1. 旋转控制
if (mouse_check_button(mb_left)) {
    var target_angle = point_direction(room_width/2, room_height/2, mouse_x, mouse_y);
    target_rotation = target_angle - 90; // 偏移90度使上方为0
}
current_rotation = lerp(current_rotation, target_rotation, 0.1);

// 2. 更新浮游炮的目标位置
var count = array_length(pods);
for (var i = 0; i < count; i++) {
    if (instance_exists(pods[i])) {
        // 计算阵列角度: 中心偏移量 (i - (n-1)/2)
        var offset = (i - (count - 1) / 2) * (spread_angle / max(1, count - 1));
        var final_angle = current_rotation + 90 + offset; // +90 修正
        
        pods[i].target_x = room_width/2 + lengthdir_x(pod_radius, final_angle);
        pods[i].target_y = room_height/2 + lengthdir_y(pod_radius, final_angle);
    }
}