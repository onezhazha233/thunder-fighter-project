live;
if (!enabled) exit;

time++;

// 1. 处理冷却期 (空挡)
if (is_cooling) {
    cooldown_timer--;
    if (cooldown_timer <= 0) {
        is_cooling = false;
    }
    exit;
}

// 3. 获取攻击
if (current_attack == undefined) {
    get_next_attack();
}

// 4. 执行攻击
if (current_attack != undefined) {
    var _func = method(id, current_attack.func);
    if (current_attack != undefined) {
        last_id = current_attack.id_num;
        attack_time++; 
    }
	_func(current_attack.exarg);
}