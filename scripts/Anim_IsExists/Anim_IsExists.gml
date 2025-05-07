function Anim_IsExists(_target, _var_name = "") {
    // 先检查全局暂停
    if (global._gmu_anim_system.paused) {
        return false;
    }
    
    for (var i = 0; i < array_length(global._gmu_anim_system.animations); i++) {
        var _anim = global._gmu_anim_system.animations[i];
        
        // 通过ID匹配
        if (is_real(_target) && _target <= -10) {
            if (_anim.id == _target && (_var_name == "" || _anim.var_name == _var_name)) {
                return true;
            }
        } 
        // 通过目标匹配
        else if (_anim.target == _target || 
                (instance_exists(_anim.target) && _anim.target.object_index == _target) ||
                (_target == global && _anim.target == global)) {
            
            if (_var_name == "" || _anim.var_name == _var_name) {
                return true;
            }
        }
    }
    
    return false;
}