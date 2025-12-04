function laser_find_width(_ox, _oy, _dir, _range, _width, _object, _prec, _notme, _ignoreInstances = []) {
    
    // --- 1. 静态资源池 ---
    // 即使有一百万次调用，这里也只会在第一次运行分配内存
    static _collision_list = ds_list_create();
    static _detector_inst = noone;
    
    // 安全检查：如果探测器意外丢失（极其罕见），重建它
    if (!instance_exists(_detector_inst)) {
        _detector_inst = instance_create_depth(0, 0, 0, laser_detector);
        _detector_inst.visible = false;
        _detector_inst.persistent = true; // 加固：防止房间切换时被自动销毁
    }
    
    // --- 2. 状态重置 (关键！) ---
    // 无论上一个使用者做了什么，这里全部强制重置，防止“污染”
    // 针对 2x2 中心原点贴图的逻辑
    var _mid_dist = _range / 2;
    _detector_inst.x = _ox + lengthdir_x(_mid_dist, _dir);
    _detector_inst.y = _oy + lengthdir_y(_mid_dist, _dir);
    _detector_inst.image_angle = _dir;
    _detector_inst.image_xscale = _range / 2;
    _detector_inst.image_yscale = max(1, _width) / 2;
    
    // 强制设置碰撞掩码，防止被外部修改
    // 如果你有不同的 mask 需求，可以在这里根据参数 sprite_index 切换
    _detector_inst.mask_index = spr_pixel2x; 

    // --- 3. 执行检测 ---
    ds_list_clear(_collision_list); // 必须清空！
    
    var _caller_id = (instance_exists(self) ? id : noone);
    var _count = 0;
    
    with (_detector_inst) {
        _count = instance_place_list(x, y, _object, _collision_list, false);
    }
    
    if (_count == 0) return [];

    // --- 4. 精确计算 (CPU 密集部分) ---
    var _result_array = [];
    var _max_checks = 16; // 性能优化：高频环境下，适当降低二分次数(比如10->8)可以显著提升FPS
    
    for (var i = 0; i < _count; i++) {
        var _inst = _collision_list[| i];
        
        // 极速跳过无效实例
		var shouldIgnore = false;
		for(var j = 0; j < array_length(_ignoreInstances);j++){
			var _element = _ignoreInstances[j];
			if(_element == _inst) shouldIgnore = true;
		}
		if(shouldIgnore) continue;
        if (!instance_exists(_inst)) continue;
        if (_notme && _inst == _caller_id) continue;
        
        // ... (此处保持之前的二分代码不变) ...
        var _min = 0;
        var _max = _range;
        var _hit = false;
        
        repeat (_max_checks) {
             var _curr = (_min + _max) * 0.5;
             // 移动探测器进行试探
             var _off = _curr / 2;
             _detector_inst.image_xscale = _off;
             _detector_inst.x = _ox + lengthdir_x(_off, _dir);
             _detector_inst.y = _oy + lengthdir_y(_off, _dir);
             
             var _col = false;
             with(_detector_inst) if(place_meeting(x, y, _inst)) _col = true;
             
             if(_col) { _max = _curr; _hit = true; }
             else { _min = _curr; }
        }
        
        if (_hit) array_push(_result_array, [_inst, _max]);
    }

    // --- 5. 清理现场 ---
    // 为了防止物理引擎在函数结束后还计算这个探测器的碰撞
    // 将其移出游戏区域或禁用 mask (可选，极大优化物理性能)
    _detector_inst.x = -99999;
    _detector_inst.y = -99999; 
    
    array_sort(_result_array, function(a, b) { return a[1] - b[1]; });
    
    return _result_array;
}