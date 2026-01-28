/// @desc 初始化动画系统
function Anim_Init() {
    global._gmu_anim_system = {
        animations: [],
        next_id: -10,
        paused: false
    };

    enum ANIM_TWEEN { LINEAR, SINE, QUAD, CUBIC, QUART, QUINT, EXPO, CIRC, BACK, ELASTIC, BOUNCE };
    enum ANIM_EASE { IN, OUT, IN_OUT };
}

/// @desc 创建动画
/// @param _target 目标(实例ID/struct/global)
/// @param _var_name 变量名字符串
/// @param _tween 缓动类型
/// @param _ease 缓动方向
/// @param _start 起始值
/// @param _change 变化量(目标值-起始值)
/// @param _duration 持续时长(帧)
/// @param _delay 延迟(帧)
/// @param _on_complete 结束回调函数(可选)
/// @param _callback_args 回调参数数组(可选)
function Anim_Create(_target, _var_name, _tween, _ease, _start, _change, _duration, _delay = 0, _on_complete = undefined, _callback_args = []) {
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
        time: 0,
        paused: false,
        on_complete: _on_complete,
        callback_args: _callback_args,
        arg0: 0, // 预留给 Back/Elastic 的参数
        arg1: 0
    };

    array_push(global._gmu_anim_system.animations, _anim);
    return _anim.id;
}

/// @desc 销毁特定动画
/// @param _target 目标实例/结构体/动画ID/对象索引
/// @param _var_name 变量名字符串 (如果是路径动画请传 "" 或 "__PATH__")
/// @param _skip_to_end 是否立即将目标设置为动画结束时的状态
function Anim_Destroy(_target, _var_name = "", _skip_to_end = false) {
    var _found = false;
    var _animations = global._gmu_anim_system.animations;
    
    // 反向遍历数组，确保删除元素时索引不失效
    for (var i = array_length(_animations) - 1; i >= 0; i--) {
        var _anim = _animations[i];
        var _match = false;
        
        // 1. 匹配逻辑
        if (is_real(_target) && _target <= -10) {
            // 通过 动画ID 匹配
            _match = (_anim.id == _target);
        } 
        else {
            // 通过 目标对象/结构体 匹配
            var _is_target = (_anim.target == _target) || 
                             (instance_exists(_anim.target) && _anim.target.object_index == _target) ||
                             (_target == global && _anim.target == global);
            
            // 检查变量名是否匹配 (如果 _var_name 为空，则匹配该目标下的所有动画)
            var _is_var = (_var_name == "" || _anim.var_name == _var_name);
            
            _match = _is_target && _is_var;
        }
        
        // 2. 如果匹配成功
        if (_match) {
            _found = true;
            
            // 处理“跳到终点”逻辑
            if (_skip_to_end) {
                if (_anim.var_name == "__PATH__") {
                    // --- 路径动画：跳到贝塞尔终点坐标 ---
                    var _final_pos = _anim.path_data.end_point;
                    _anim.target.x = _final_pos[0];
                    _anim.target.y = _final_pos[1];
                } 
                else {
                    // --- 普通变量动画：计算最终值并设置 ---
                    var _final_value = _anim.start + _anim.change;
                    if (_anim.target == global) {
                        variable_global_set(_anim.var_name, _final_value);
                    } else if (is_struct(_anim.target)) {
                        variable_struct_set(_anim.target, _anim.var_name, _final_value);
                    } else if (instance_exists(_anim.target)) {
                        variable_instance_set(_anim.target, _anim.var_name, _final_value);
                    }
                }
            }
            
            // 从系统中移除动画
            array_delete(_animations, i, 1);
        }
    }
    
    return _found;
}

///@arg tween
///@arg ease
///@arg time
///@arg arg_0*
///@arg arg_1*
function Anim_GetValue() {
	var TWEEN=argument[0];
	var EASE=argument[1];
	var TIME=argument[2];
	var ARG_0=0;
	var ARG_1=0;
	if(argument_count>=4){
		ARG_0=argument[3];
	}
	if(argument_count>=5){
		ARG_1=argument[4];
	}

	var r=0;
	var t=TIME;
	var b=0;
	var c=1;
	var d=1;

	switch(TWEEN){
		case ANIM_TWEEN.LINEAR:
			r=(t/d)*c+b;
			break;
		
		case ANIM_TWEEN.SINE:
			switch(EASE){
				case ANIM_EASE.IN:
					r=-c*cos(t/d*(pi/2))+c+b;
					break;
				case ANIM_EASE.OUT:
					r=c*sin(t/d*(pi/2))+b;
					break;
				case ANIM_EASE.IN_OUT:
					r=-c/2*(cos(pi*t/d)-1)+b;
					break;
			}
			break;
		
		case ANIM_TWEEN.QUAD:
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=c*t*t+b;
					break;
				case ANIM_EASE.OUT:
					t/=d;
					r=-c*t*(t-2)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2;
					if(t<1){
						r=c/2*t*t+b;
					}else{
						r=-c/2*((--t)*(t-2)-1)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.CUBIC:
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=c*t*t*t+b;
					break;
				case ANIM_EASE.OUT:
					t=t/d-1
					r=c*(t*t*t+1)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2
					if(t<1){
						r=c/2*t*t*t+b;
					}else{
						t-=2;
						r=c/2*(t*t*t+2)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.QUART:
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=c*t*t*t*t+b;
					break;
				case ANIM_EASE.OUT:
					t=t/d-1;
					r=-c*(t*t*t*t-1)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2
					if(t<1){
						r=c/2*t*t*t*t+b;
					}else{
						t-=2;
						r=-c/2*(t*t*t*t-2)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.QUINT:
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=c*t*t*t*t*t + b;
					break;
				case ANIM_EASE.OUT:
					t=t/d-1;
					r=c*(t*t*t*t*t+1)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2
					if(t<1){
						r=c/2*t*t*t*t*t+b;
					}else{
						t-=2;
						r=c/2*(t*t*t*t*t+2)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.EXPO:
			switch(EASE){
				case ANIM_EASE.IN:
					if(t==0){
						r=b;
					}else{
						r=c*power(2,10*(t/d-1))+b;
					}
					break;
				case ANIM_EASE.OUT:
					if(t==d){
						r=b+c;
					}else{
						r=c * (-power(2,-10*t/d)+1)+b;
					}
					break;
				case ANIM_EASE.IN_OUT:
					if (t==0){
						r=b;
					}
					if(t==d){
						r=b+c;
					}
					t/=d/2;
					if (t<1){
						r=c/2*power(2,10*(t-1))+b;
					}else{
						r=c/2*(-power(2,-10*--t)+2)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.CIRC:
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=-c*(sqrt(1-t*t)-1)+b;
					break;
				case ANIM_EASE.OUT:
					t=t/d-1;
					r=c*sqrt(1-t*t)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2;
					if(t<1){
						r=-c/2*(sqrt(1-t*t)-1)+b;
					}else{
						t-=2;
						r=c/2*(sqrt(1-t*t)+1)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.BACK:
			if(ARG_0>0){
				var s=ARG_0;
			}else{
				var s=1.70158;
			}
			switch(EASE){
				case ANIM_EASE.IN:
					t/=d;
					r=c*t*t*((s+1)*t-s)+b;
					break;
				case ANIM_EASE.OUT:
					t=t/d-1;
					r=c*(t*t*((s+1)*t+s)+1)+b;
					break;
				case ANIM_EASE.IN_OUT:
					t/=d/2;
					s*=1.525;
					if(t<1){
						r=c/2*(t*t*((s+1)*t-s))+b;
					}else{
						t-=2;
						r=c/2*(t*t*((s+1)*t+s)+2)+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.ELASTIC:
			var a=ARG_0;
			var p=ARG_1;
			switch(EASE){
				case ANIM_EASE.IN:
					if(t==0){
						r=b;
						break;
					}
					t/=d;
					if(t==1){
						r=b+c;
						break;
					}
					if(p==0){
						p=d*0.3;
					}
					if(a==0||a<abs(c)){
						a=c;
						var s=p/4;
					}else{
						var s=p/(2*pi)*arcsin(c/a);
					}
					t-=1;
					r=-(a*power(2,10*t)* sin((t*d-s)*(2*pi)/p))+b;
					break;
				case ANIM_EASE.OUT:
					if(t==0){
						r=b;
						break;
					}
					t/=d;
					if(t==1){
						r=b+c;
						break;
					}
					if(p==0){
						p=d*0.3;
					}
					if(a==0||a<abs(c)){
						a=c;
						var s=p/4;
					}else{
						var s=p/(2*pi)*arcsin(c/a);
					}
					r=a*power(2,-10*t)*sin((t*d-s)*(2*pi)/p)+c+b;
					break;
				case ANIM_EASE.IN_OUT:
					if(t==0){
						r=b;
						break;
					}
					t/=d/2;
					if(t==2){
						r=b+c;
						break;
					}
					if(p==0){
						p=d*(0.3*1.5);
					}
					if(a==0||a<abs(c)){
						a=c;
						var s=p/4;
					}else{
						var s=p/(2*pi)*arcsin(c/a);
					}
					t-=1;
					if(t<1){
						r=-0.5*(a*power(2,10*t)*sin((t*d-s)*(2*pi)/p))+b;
					}else{
						r=a*power(2,-10*t)*sin((t*d-s)*(2*pi)/p )*0.5+c+b;
					}
					break;
			}
			break;
		
		case ANIM_TWEEN.BOUNCE:
			switch(EASE){
				case ANIM_EASE.IN:
					t=d-t;
					t/=d;
					if (t<1/2.75){
						r=c*(7.5625*t*t);
					}else if(t<2/2.75){
						t-=1.5/2.75;
						r=c*(7.5625*t*t+0.75);
					}else if(t<2.5/2.75) {
						t-=2.25/2.75;
						r=c*(7.5625*t*t+0.9375);
					}else{
						t-=2.625/2.75;
						r=c*(7.5625*t*t +0.984375);
					}
					r=c-r+b;
					break;
				case ANIM_EASE.OUT:
					t/=d;
					if (t<1/2.75){
						r=c*(7.5625*t*t)+b;
					}else if(t<2/2.75){
						t-=1.5/2.75;
						r=c*(7.5625*t*t+0.75)+b;
					}else if(t<2.5/2.75) {
						t-=2.25/2.75;
						r=c*(7.5625*t*t+0.9375)+b;
					}else{
						t-=2.625/2.75;
						r=c*(7.5625*t*t +0.984375)+b;
					}
					break;
				case ANIM_EASE.IN_OUT:
					var ease_in;
					if(t<d/2){
						t*=2;
						ease_in=true;
					}else{
						t*=2;
						t-=d;
						ease_in=false;
					}
				
					t/=d;
					if (t<1/2.75){
						r=c*(7.5625*t*t);
					}else if(t<2/2.75){
						t-=1.5/2.75;
						r=c*(7.5625*t*t+0.75);
					}else if(t<2.5/2.75) {
						t-=2.25/2.75;
						r=c*(7.5625*t*t+0.9375);
					}else{
						t-=2.625/2.75;
						r=c*(7.5625*t*t +0.984375);
					}
				
					if(ease_in){
						r=r*0.5+b;
					}else{
						r=r*0.5+c*0.5+b;
					}
					break;
			}
			break;
	}

	return r;
}

/// @desc 检查动画是否存在 (修复了暂停导致的判断错误)
function Anim_IsExists(_target, _var_name = "") {
    var _anims = global._gmu_anim_system.animations;
    for (var i = 0; i < array_length(_anims); i++) {
        var _anim = _anims[i];
        if (is_real(_target) && _target <= -10) {
            if (_anim.id == _target) return true;
        } else {
            if (_anim.target == _target && (_var_name == "" || _anim.var_name == _var_name)) return true;
        }
    }
    return false;
}

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

// 暂停/继续所有动画
function Anim_PauseAll(_pause) {
    global._gmu_anim_system.paused = _pause;
    return true;
}

/// @desc 核心步进逻辑 (放在某个持久化对象的 Step 事件中)
function Anim_Step() {
    if (global._gmu_anim_system.paused) return;

    var _anims = global._gmu_anim_system.animations;
    for (var i = array_length(_anims) - 1; i >= 0; i--) {
        var _anim = _anims[i];
        if (_anim.paused) continue;

        // 目标存在性检查 (适配实例、结构体、全局)
        if (!instance_exists(_anim.target) && !is_struct(_anim.target) && _anim.target != global) {
            array_delete(_anims, i, 1);
            continue;
        }

        if (_anim.delay > 0) { _anim.delay--; continue; }

        _anim.time++;
        var _progress = min(_anim.time / _anim.duration, 1);
        
        // --- 核心修改：获取缓动后的进度 t ---
        var _t = Anim_GetValue(_anim.tween, _anim.ease, _progress, _anim.arg0, _anim.arg1);

        // --- 核心修改：判断动画类型 ---
        if (_anim.var_name == "__PATH__") {
            // 情况 A: 贝塞尔路径动画 (同时更新 x 和 y)
            var _pos = _Bezier_Solver_Internal(_anim.path_data, _t);
            _anim.target.x = _pos[0];
            _anim.target.y = _pos[1];
        } 
        else {
            // 情况 B: 原有的普通单变量动画 (x, y, alpha, etc.)
            var _value = _anim.start + _anim.change * _t;
            if (_anim.target == global) {
                variable_global_set(_anim.var_name, _value);
            } else if (is_struct(_anim.target)) {
                variable_struct_set(_anim.target, _anim.var_name, _value);
            } else {
                variable_instance_set(_anim.target, _anim.var_name, _value);
            }
        }

        // 结束与回调逻辑 (保持原样)
        if (_anim.time >= _anim.duration) {
            var _cb = _anim.on_complete;
            array_delete(_anims, i, 1);
            if (!is_undefined(_cb)) {
                method(_anim.target, _cb)();
            }
        }
    }
}

function Anim_Uninit() {
    // 清空动画数组
    global._gmu_anim_system.animations = [];
    return true;
}
	
/// @desc 创建路径数据对象
function Bezier_Path_Create(_start_x, _start_y, _end_x, _end_y) {
    return {
        start_point: [_start_x, _start_y],
        end_point:   [_end_x, _end_y],
        controls:    [] // 存储任意数量的中间点
    };
}

/// @desc 向路径中添加一个中间点
function Bezier_Path_Add_Point(_path_obj, _x, _y) {
    array_push(_path_obj.controls, [_x, _y]);
}

/// @desc 内部算法：高阶德卡斯特里奥 (De Casteljau)
function _Bezier_Solver_Internal(_path_obj, _t) {
    // 1. 准备点阵：起点 -> 控制点... -> 终点
    var _pts = [];
    array_push(_pts, _path_obj.start_point);
    for (var i = 0; i < array_length(_path_obj.controls); i++) {
        array_push(_pts, _path_obj.controls[i]);
    }
    array_push(_pts, _path_obj.end_point);

    // 2. 迭代差值计算
    var _count = array_length(_pts);
    while (_count > 1) {
        for (var i = 0; i < _count - 1; i++) {
            _pts[i] = [
                lerp(_pts[i][0], _pts[i+1][0], _t),
                lerp(_pts[i][1], _pts[i+1][1], _t)
            ];
        }
        _count--;
    }
    return _pts[0]; // 返回最终坐标 [x, y]
}

/// @desc 创建高阶路径动画
function Anim_Path_Create(_target, _path_obj, _tween, _ease, _duration, _delay = 0, _on_complete = undefined) {
    var _anim = {
        id: global._gmu_anim_system.next_id--,
        target: _target,
        var_name: "__PATH__",  // 核心标记：路径动画专用
        path_data: _path_obj, // 存储贝塞尔对象
        tween: _tween,
        ease: _ease,
        duration: _duration,
        delay: _delay,
        time: 0,
        paused: false,
        on_complete: _on_complete,
        arg0: 0, arg1: 0 // 预留给某些缓动公式
    };

    array_push(global._gmu_anim_system.animations, _anim);
    return _anim.id;
}