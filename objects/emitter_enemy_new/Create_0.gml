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