/// @function laser_find_width(ox, oy, dir, range, width, object_or_id, prec, notme, [ignore_array])
function laser_find_width(_ox, _oy, _dir, _range, _width, _object, _prec, _notme, _ignoreInstances = undefined) {
    
    // --- 1. 静态资源 ---
    static _collision_list = ds_list_create();
    static _detector_inst = noone;
    
    if (!instance_exists(_detector_inst)) {
        _detector_inst = instance_create_depth(0, 0, 0, laser_detector);
        _detector_inst.visible = false;
        _detector_inst.persistent = true;
        _detector_inst.mask_index = spr_pixel2x;   // 创建时一次性设置
    }
    
    // --- 预计算方向单位向量，避免反复调用 lengthdir ---
    var _dx = dcos(_dir);
    var _dy = -dsin(_dir);  // GameMaker 中 dsin 与 lengthdir_y 符号一致
    
    // --- 2. 状态重置 ---
    var _mid_dist = _range * 0.5;
    _detector_inst.x = _ox + _mid_dist * _dx;
    _detector_inst.y = _oy + _mid_dist * _dy;
    _detector_inst.image_angle = _dir;
    _detector_inst.image_xscale = _mid_dist;          // 半长，即 range/2
    _detector_inst.image_yscale = max(1, _width) * 0.5;
    // mask_index 已固定，无需重复设置
    
    // --- 3. 粗略检测 ---
    ds_list_clear(_collision_list);
    var _caller_id = id;
    var _count = 0;
    
    with (_detector_inst) {
        _count = instance_place_list(x, y, _object, _collision_list, false);
    }
    
    if (_count == 0) return [];
    
    // --- 4. 精确检测 ---
    var _result_array = [];
    var _max_checks = _prec ? 12 : 8;   // 直接使用三元表达式
    var _half_width = _width * 0.5;     // 未使用，但保留以备扩展
    
    for (var i = 0; i < _count; i++) {
        var _inst = _collision_list[| i];
        
        if (!instance_exists(_inst)) continue;
        if (_notme && _inst == _caller_id) continue;
        
        // 忽略列表检查
        if (!is_undefined(_ignoreInstances)) {
            if (array_contains(_ignoreInstances, _inst)) continue;
        }
        
        // --- 二分查找 ---
        var _min = 0;
        var _max = _range;
        var _hit = false;
        
        with (_detector_inst) {
		    repeat (_max_checks) {
		        var _curr = (_min + _max) * 0.5;
		        var _half_curr = _curr * 0.5; 
        
		        image_xscale = _half_curr;
		        x = _ox + _half_curr * _dx;
		        y = _oy + _half_curr * _dy;
        
		        if (place_meeting(x, y, _inst)) {
		            _max = _curr;
		            _hit = true;
		        } else {
		            _min = _curr;
		        }
		    }
		}
        
        if (_hit) array_push(_result_array, [_inst, _max]);
    }
    
    // --- 5. 清理与返回 ---
    //_detector_inst.x = -99999;
    //_detector_inst.y = -99999;
    
    if (array_length(_result_array) > 1) {
        array_sort(_result_array, function(a, b) { return a[1] - b[1]; });
    }
    
    return _result_array;
}