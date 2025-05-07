// 暂停/继续特定动画
function Anim_Pause(_target, _var_name = "", _pause = true) {
    var _found = false;
    
    for (var i = 0; i < array_length(global._gmu_anim_system.animations); i++) {
        var _anim = global._gmu_anim_system.animations[i];
        
        // 通过ID匹配
        if (is_real(_target) && _target <= -10) {
            if (_anim.id == _target && (_var_name == "" || _anim.var_name == _var_name)) {
                _anim.paused = _pause;
                _found = true;
            }
        } 
        // 通过目标匹配
        else if (_anim.target == _target || 
                (instance_exists(_anim.target) && _anim.target.object_index == _target) ||
                (_target == global && _anim.target == global)) {
            
            if (_var_name == "" || _anim.var_name == _var_name) {
                _anim.paused = _pause;
                _found = true;
            }
        }
    }
    
    return _found;
}