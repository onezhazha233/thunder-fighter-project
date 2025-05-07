function Anim_Destroy(_target, _var_name = "", _skip_to_end = false) {
    var _found = false;
    
    for (var i = array_length(global._gmu_anim_system.animations) - 1; i >= 0; i--) {
        var _anim = global._gmu_anim_system.animations[i];
        
        // 匹配逻辑
        var _match = false;
        
        // 通过ID匹配
        if (is_real(_target) && _target <= -10) {
            _match = (_anim.id == _target && (_var_name == "" || _anim.var_name == _var_name));
        } 
        // 通过目标匹配
        else {
            _match = (_anim.target == _target || 
                     (instance_exists(_anim.target) && _anim.target.object_index == _target) ||
                     (_target == global && _anim.target == global)) &&
                    (_var_name == "" || _anim.var_name == _var_name);
        }
        
        if (_match) {
            _found = true;
            
            // 可选: 跳到最终值
            if (_skip_to_end) {
                var _final_value = _anim.start + _anim.change;
                if (_anim.target == global) {
                    variable_global_set(_anim.var_name, _final_value);
                } else {
                    variable_instance_set(_anim.target, _anim.var_name, _final_value);
                }
            }
            
            // 移除动画
            array_delete(global._gmu_anim_system.animations, i, 1);
        }
    }
    
    return _found;
}