live;
for(var i = 0; i < array_length(graze_effects); i++) {
    var _e = graze_effects[i];
    
    // --- 核心计算：衰减比率 ---
    // 刚创建时：30/30 = 1.0
    // 半程时：  15/30 = 0.5
    // 结束时：   0/30 = 0.0
    var _ratio = _e.life / _e.max_life;
    
    // 计算最终绘制坐标 (玩家世界坐标 + 粒子相对坐标)
    var _draw_x = x + _e.lx;
    var _draw_y = y + _e.ly;
    
    draw_sprite_ext(
        spr_effect_graze, // 你的贴图
        0,                // 子图像索引
        _draw_x,          // X
        _draw_y,          // Y
        (_ratio/2+0.5),           // X缩放：随寿命从 1 变到 0
        (_ratio/2+0.5),           // Y缩放：随寿命从 1 变到 0
        0,                // 旋转角度 (如果想要旋转，也可以存一个 angle 变量)
        c_white,          // 颜色
        _ratio            // 透明度：随寿命从 1 变到 0
    );
}

// 倒序遍历数组 (从后往前)，这样删除元素不会打乱索引
for (var i = array_length(graze_effects) - 1; i >= 0; i--) {
    var _e = graze_effects[i];
    
    // 1. 更新相对坐标 (让粒子相对于中心点扩散)
    _e.lx += _e.hsp;
    _e.ly += _e.vsp;
    
    // 2. 减少寿命
    _e.life -= 1;
    
    // 3. 如果寿命结束，从数组中移除
    if (_e.life <= 0) {
        array_delete(graze_effects, i, 1);
    }
}