function Anim_Step() {
    if (global._gmu_anim_system.paused) {
        return false;
    }

    for (var i = array_length(global._gmu_anim_system.animations) - 1; i >= 0; i--) {
        var _anim = global._gmu_anim_system.animations[i];
        
        if (_anim.paused) continue;

        // 检查目标是否存在
        var _target_exists = (_anim.target == global||is_struct(_anim.target)) ? true : instance_exists(_anim.target);
        if (!_target_exists) {
            array_delete(global._gmu_anim_system.animations, i, 1);
            continue;
        }

        // 处理延迟
        if (_anim.delay > 0) {
            _anim.delay--;
            continue;
        }

        // 更新动画
        if (_anim.time < _anim.duration) {
            _anim.time++;
            
            var _progress = _anim.time / _anim.duration;
            var _value = _anim.start + _anim.change * Anim_GetValue(
                _anim.tween, 
                _anim.ease, 
                _progress, 
                _anim.arg0, 
                _anim.arg1
            );

            // 设置值
            if (_anim.target == global) {
                variable_global_set(_anim.var_name, _value);
            } else if(is_struct(_anim.target)){
                variable_struct_set(_anim.target, _anim.var_name, _value);
            }
			else{
				variable_instance_set(_anim.target, _anim.var_name, _value);
			}
        } else {
            // 动画完成，设置最终值
            var _final_value = _anim.start + _anim.change;
            if (_anim.target == global) {
                variable_global_set(_anim.var_name, _final_value);
            } else if(is_struct(_anim.target)){
                variable_struct_set(_anim.target, _anim.var_name, _final_value);
            }
			else{
				variable_instance_set(_anim.target, _anim.var_name, _final_value);
			}
            
            // 移除完成的动画
            array_delete(global._gmu_anim_system.animations, i, 1);
        }
    }

    return true;
}