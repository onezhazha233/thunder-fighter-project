live;
// 模式定义
enum EMITTER_MODE { FIXED, FIXED_THEN_RANDOM }

// 配置
mode = EMITTER_MODE.FIXED_THEN_RANDOM;
fixed_sequence = []; // 存放攻击结构体
random_pool = [];    // 存放攻击结构体

// 状态变量
enabled = false;     // 发射器启用状态
time = 0;            // 发射器运行总时间
attack_time = 0;     // 当前攻击内部经过的帧数
last_id = -1;        // 上一个执行的攻击ID (用于防止随机连续)

current_attack = undefined;
fixed_idx = 0;       // 固定序列索引

cooldown_timer = 0; // 空挡计时器
is_cooling = false; // 是否处于空挡期

function create_attack(_id, _func,_cooldown = 0, _weight = 1,_exarg=0) {
    return {
        id_num: _id,
        func: _func,
		cooldown: _cooldown,
        weight: _weight,
		exarg: _exarg
    };
}

// 结束当前攻击
function end_attack() {
    // 先掐断本攻击挂着的弹幕调度
    FireStop();

    // 只有当有当前攻击时才计算空挡
    if (current_attack != undefined) {
        cooldown_timer = current_attack.cooldown;
    } else {
        cooldown_timer = 0;
    }
    
    current_attack = undefined;
    attack_time = 0;
    
    // 如果有空挡，进入空挡模式，否则进入等待帧模式
    if (cooldown_timer > 0) {
        is_cooling = true;
    }
}

// 随机获取逻辑 (仅在需要新攻击时调用)
function get_next_attack() {
    // 1. 固定序列逻辑
    if (mode == EMITTER_MODE.FIXED || (mode == EMITTER_MODE.FIXED_THEN_RANDOM && fixed_idx < array_length(fixed_sequence))) {
        if(mode == EMITTER_MODE.FIXED){
			if (fixed_idx >= array_length(fixed_sequence)) {
	            fixed_idx = 0;
	        }
		}
        
        if (fixed_idx < array_length(fixed_sequence)) {
            current_attack = fixed_sequence[fixed_idx];
            fixed_idx++;
            return; // 成功获取，退出
        }
    }
    
    // 2. 随机逻辑 (过滤掉 last_id)
    var _candidates = [];
    var _total_weight = 0;
    
    for (var i = 0; i < array_length(random_pool); i++) {
        if (random_pool[i].id_num != last_id) {
            array_push(_candidates, random_pool[i]);
            _total_weight += random_pool[i].weight;
        }
    }
    
    // 如果候选列表为空（例如池子里只有一个选项），则必须包含所有以防止报错
    if (_total_weight <= 0) {
        _candidates = random_pool;
        for (var i = 0; i < array_length(random_pool); i++) _total_weight += random_pool[i].weight;
    }
    
    // 加权随机选择
    var _r = random(_total_weight);
    var _cur = 0;
    for (var i = 0; i < array_length(_candidates); i++) {
        _cur += _candidates[i].weight;
        if (_r < _cur) {
            current_attack = _candidates[i];
            break;
        }
    }
}
	
Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
	with(enemy_blockbullet){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
}

GetEnemy = function(){
	if(instance_exists(mark)){
		return mark;
	}
	else{
		return noone;
	}
}

MoveEnemy = function(enabled){
	if(instance_exists(GetEnemy())){
		GetEnemy().SetMoveEnabled(enabled);
	}
}

// ============================================================
//  弹幕调度（实例内自持，不依赖任何全局系统）
//  ------------------------------------------------------------
//  调度器就挂在发射器自己身上，由 Step 中的 RepTick() 驱动：
//    · 发射器 Step 不跑（冻结 / enabled=false / 未激活）→ 整体暂停，进度保留
//    · 发射器被销毁（敌人死亡 / 切换房间）→ 随实例一并消散
//  弹幕一旦注册，不会再因 attack_time 的帧判断抖动而丢失。
// ============================================================
_reps     = [];   // 全部在跑的弹幕调度
_atk_reps = [];   // 归属于当前攻击的部分，end_attack 时统一掐断

/// @func Fire(_cb, _times, _interval, _delay, _base)
/// @desc 注册重复发射，归属当前攻击
/// @param {Function} _cb       回调 function(index)，index 从 0 开始
/// @param {Real}     _times    次数，<= 0 表示无限
/// @param {Real}     _interval 间隔帧，<= 0 表示每帧一次
/// @param {Real}     _delay    首次延迟帧
/// @param {Real}     _base     可选，回调第二参的基准帧号
/// @returns {Struct} 调度节点
/// 说明：回调在这里就绑定到发射器实例（method），因为 struct 字段调用
///       会把 self 变成该 struct，届时用户写的 x / y 会解析失败。
Fire = function(_cb, _times = 1, _interval = 0, _delay = 0, _base = undefined){
	var _r = {
		cb       : is_method(_cb) ? _cb : method(id, _cb),
		times    : is_real(_times)   ? floor(_times)   : 1,
		interval : max(is_real(_interval) ? floor(_interval) : 0, 0),
		timer    : max(is_real(_delay)    ? floor(_delay)    : 0, 0),
		index    : 0,
		base     : _base,
		done     : false
	};
	array_push(_reps, _r);
	array_push(_atk_reps, _r);
	return _r;
}

/// @func FireStop()
/// @desc 立即终止当前攻击注册的所有发射
FireStop = function(){
	for(var _i = 0; _i < array_length(_atk_reps); _i++){
		_atk_reps[_i].done = true;
	}
	_atk_reps = [];
}

/// @func RepTick()
/// @desc 推进本实例的弹幕调度，由 Step 每帧调用一次
RepTick = function(){
	// 正向遍历：同一帧内的多个节点按注册顺序依次执行，
	// 与原 attack 代码的书写顺序一致（例如"先刷新目标坐标，再发射"）。
	// 反向遍历会颠倒这个顺序，导致同帧冲突时用到上一批的旧值。
	// _n 固定为本次进入时的长度，本帧回调中新注册的节点留到下一帧处理。
	var _n = array_length(_reps);
	var _i = 0;
	while(_i < _n){
		var _r = _reps[_i];
		if(_r.done){
			array_delete(_reps, _i, 1);
			_n -= 1;
			continue;
		}

		_r.timer -= 1;
		while(!_r.done && _r.timer <= 0){
			if(_r.times > 0 && _r.index >= _r.times){ _r.done = true; break; }

			if(is_undefined(_r.base)){
				_r.cb(_r.index);
			}
			else{
				_r.cb(_r.index, _r.base + _r.index * max(_r.interval, 1));
			}
			_r.index += 1;

			if(_r.times > 0 && _r.index >= _r.times){ _r.done = true; break; }
			if(_r.interval <= 0){ _r.timer = 0; break; }
			_r.timer += _r.interval;
		}

		if(_r.done){
			array_delete(_reps, _i, 1);
			_n -= 1;
			continue;
		}
		_i += 1;
	}
}

/// @func At(_frame, _cb)
/// @desc 单帧关键帧，等价于原来的 if(attack_time = _frame)
///       请在 attack_time = 1 处集中注册，否则延迟会算错
At = function(_frame, _cb){
	var _d = _frame - attack_time;
	if(_d < 0) return undefined;   // 该帧已错过，不再补发
	return Fire(_cb, 1, 0, _d);
}

/// @func Every(_interval, _times, _cb, _delay)
/// @desc 周期发射，等价于原来的 if(attack_time mod N = 0)
Every = function(_interval, _times, _cb, _delay = 0){
	return Fire(_cb, _times, _interval, _delay);
}

/// @func During(_start, _end, _interval, _cb)
/// @desc 区间内周期发射，等价于 if(attack_time >= A && attack_time < B && ... mod N = 0)
///       区间为左闭右开 [start, end)，end 本身不发射，与 for 循环的直觉一致。
///       回调收到 (index, frame)，frame 为该次触发对应的攻击帧号
During = function(_start, _end, _interval, _cb){
	var _iv = max(_interval, 1);
	// 左闭右开：帧序列为 start, start+iv, ... 且 < end
	var _count = ceil((_end - _start) / _iv);
	if(_count < 1) return undefined;
	var _delay = max(_start - attack_time, 0);

	// 不写闭包：帧号基准通过 base 字段交给 RepTick 计算，
	// 避免匿名函数捕获外层局部变量失败而报 not set。
	return Fire(_cb, _count, _iv, _delay, _start);
}