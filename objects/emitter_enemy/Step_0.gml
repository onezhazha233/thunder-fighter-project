live;
if (!enabled) exit;

time++;

// 兜底：攻击已收尾但仍有弹幕调度残留。
// 正常情况下 end_attack() 已经清过，这里防的是子对象完全重写 end_attack 的情况。
if (current_attack == undefined && array_length(_atk_reps) > 0) FireStop();

// 推进弹幕调度。本帧新注册的节点从下一帧开始计时。
// 本行不执行（enabled=false / 被冻结 / 已销毁）时，弹幕整体暂停。
RepTick();

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