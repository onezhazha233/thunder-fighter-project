live;
event_inherited();

// === 左侧敌人：螺旋下落 + 横向摆动 ===
enemy_0 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([120, -240], [120, 320], 40);  // 左侧快速下落
    EnemyMove_Intro(90);                         // 60帧后进入Intro状态
    EnemyMove_LoopLinear([120, 320], [220, 320], 130, 200, 0);  // 左侧横向摆动
});

// === 中间敌人：垂直俯冲 + 上下震荡 ===
enemy_1 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([360, -280], [360, 400], 40);  // 中间俯冲入场
    EnemyMove_Intro(70);                         // 同步进入Intro状态
    EnemyMove_LoopLinear([360, 400], [360, 300], 130, 180, 0);  // 中央垂直震荡
});

// === 右侧敌人：斜角切入 + 对角线往返 ===
enemy_2 = new Enemy(enemy_4b, emitter_enemy_b, function() {
    EnemyMove_Pre([600, -200], [600, 360], 40);  // 右侧斜角下落
    EnemyMove_Intro(60);                         // 同步进入Intro状态
    EnemyMove_LoopLinear([600, 360], [500, 260], 80, 220, 0);   // 右侧对角线往返
});

// === 敌人组队入队（编号连续，间隔20帧分批入场） ===
ds_queue_enqueue(enemies, [[enemy_0], 10]);
ds_queue_enqueue(enemies, [[enemy_1], 20]);
ds_queue_enqueue(enemies, [[enemy_2], 20]);