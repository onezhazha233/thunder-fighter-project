function Anim_Create(_target, _var_name, _tween, _ease, _start, _change, _duration, _delay = 0, _arg0 = 0, _arg1 = 0) {
    var _anim = {
        id: global._gmu_anim_system.next_id--,
        target: _target,
        var_name: _var_name,
        tween: _tween,
        ease: _ease,
        start: _start,
        change: _change,
        duration: _duration,
        delay: _delay,
        arg0: _arg0,
        arg1: _arg1,
        time: 0,
        paused: false
    };

    // 添加到系统
    array_push(global._gmu_anim_system.animations, _anim);
    return _anim.id;
}