/// @function laser_find_width(ox, oy, dir, range, width, object_or_id, prec, notme, [ignore_array])
function laser_find_width(_ox, _oy, _dir, _range, _width, _object, _prec, _notme, _ignoreInstances = undefined) {
    
    // --- 1. 静态资源 ---
    static _collision_list = ds_list_create();
    static _detector_inst = noone;
    
    if (!instance_exists(_detector_inst)) {
        _detector_inst = instance_create_depth(0, 0, 0, laser_detector);
        _detector_inst.visible = false;
        _detector_inst.persistent = true;
    }
    
    // --- 2. 状态重置 ---
    var _mid_dist = _range / 2;
    _detector_inst.x = _ox + lengthdir_x(_mid_dist, _dir);
    _detector_inst.y = _oy + lengthdir_y(_mid_dist, _dir);
    _detector_inst.image_angle = _dir;
    _detector_inst.image_xscale = _range / 2;
    _detector_inst.image_yscale = max(1, _width) / 2;
    _detector_inst.mask_index = spr_pixel2x; 

    // --- 3. 粗略检测 ---
    ds_list_clear(_collision_list);
    var _caller_id = (instance_exists(self) ? id : noone);
    var _count = 0;
    
    with (_detector_inst) {
        // 【关键点】：这里的 _object 如果是特定实例ID，列表里最多只会有一个元素
        _count = instance_place_list(x, y, _object, _collision_list, false);
    }
    
    if (_count == 0) return [];

    // --- 4. 精确检测 ---
    var _result_array = [];
    var _max_checks = 10; 
    
    for (var i = 0; i < _count; i++) {
        var _inst = _collision_list[| i];
        
        if (!instance_exists(_inst)) continue;
        if (_notme && _inst == _caller_id) continue;
        
        // 忽略列表逻辑
        if (!is_undefined(_ignoreInstances)) {
            var _should_ignore = false;
            var _len = array_length(_ignoreInstances);
            for (var j = 0; j < _len; j++) {
                if (_ignoreInstances[j] == _inst) {
                    _should_ignore = true;
                    break; 
                }
            }
            if (_should_ignore) continue;
        }

        // --- 二分查找 ---
        var _min = 0;
        var _max = _range;
        var _hit = false;
        
        repeat (_max_checks) {
             var _curr = (_min + _max) * 0.5;
             var _off = _curr * 0.5; 
             
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

    // --- 5. 清理与返回 ---
    _detector_inst.x = -99999;
    _detector_inst.y = -99999; 
    
    // 【新增优化】：如果只有一个结果，不需要排序，直接返回
    if (array_length(_result_array) > 1) {
        array_sort(_result_array, function(a, b) { return a[1] - b[1]; });
    }
    
    return _result_array;
}