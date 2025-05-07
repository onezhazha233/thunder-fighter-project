/// @desc 检查动画是否暂停
/// @param _target 目标对象/动画ID/全局标识
/// @param _var_name 变量名(可选)
function Anim_IsPaused(_target, _var_name = "") {
    // 1. 先检查全局暂停状态
    if (global._gmu_anim_system.paused) {
        return true;
    }

    // 2. 遍历动画数组
    var _animations = global._gmu_anim_system.animations;
    for (var i = 0; i < array_length(_animations); i++) {
        var _anim = _animations[i];
        
        // 3. 匹配目标类型
        var _is_match = false;
        
        // 情况1: 通过动画ID匹配
        if (is_real(_target) && _target <= -10) {
            _is_match = (_anim.id == _target);
        }
        // 情况2: 通过实例匹配
        else if (instance_exists(_target)) {
            _is_match = (_anim.target == _target || 
                        (instance_exists(_anim.target) && _anim.target.object_index == _target));
        }
        // 情况3: 全局变量动画
        else if (_target == global) {
            _is_match = (_anim.target == global);
        }
        
        // 4. 检查变量名匹配(如果提供了)
        if (_is_match && (_var_name == "" || _anim.var_name == _var_name)) {
            return _anim.paused;
        }
    }
    
    // 5. 未找到匹配动画
    return false;
}