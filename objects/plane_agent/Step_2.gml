live;
speed_x = x - xprevious

if (abs(speed_x) > ROLL_THRESHOLD) {
    // 确定目标侧翻状态（基于速度）
    var target_roll = clamp(floor(abs(speed_x)), 0, 3);
    
    if (speed_x < 0) {
        // 向左移动，左翻
        target_roll = -target_roll;
    }
    
    // 平滑过渡到目标侧翻状态
    roll_state = lerp(roll_state, target_roll, ROLL_CHANGE_SPEED);
} else {
    // 低速或静止时，恢复水平状态
    roll_state = lerp(roll_state, 0, ROLL_CHANGE_SPEED);  // 恢复速度更快
}