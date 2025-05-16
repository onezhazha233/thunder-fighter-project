live;
event_inherited();

// === 左侧重型敌人（enemy_12c0）：横向摆动 ===
enemy_0 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
    EnemyMove_Pre([120, -240], [120, 320], 40);  // 左侧快速下落
    EnemyMove_Intro(60);                         // 60帧后进入Intro状态
    EnemyMove_LoopLinear([120, 320], [220, 320], 100, 200, 0);  // 左侧横向摆动
});

// === 中间核心敌人（enemy_7c1）：螺旋下落 + 对角线往返 ===
enemy_1 = new Enemy(enemy_7c1, emitter_enemy_c1, function() {
    EnemyMove_Pre([360, -400], [360, 300], 60);  // 中间高速俯冲
    EnemyMove_Intro(70);                         // 70帧后进入Intro状态
    EnemyMove_LoopLinear([360, 300], [260, 200], 90, 240, 0);  // 对角线往返漂移
});

// === 右侧重型敌人（enemy_12c0）：垂直震荡 ===
enemy_2 = new Enemy(enemy_12c0, emitter_enemy_c0, function() {
    EnemyMove_Pre([600, -240], [600, 360], 40);  // 右侧斜角下落
    EnemyMove_Intro(60);                         // 同步进入Intro状态
    EnemyMove_LoopLinear([600, 360], [600, 260], 120, 180, 0);  // 右侧垂直震荡
});

// === 敌人组队入队（分批登场，支持多敌人同时生成） ===
ds_queue_enqueue(enemies, [[enemy_0, enemy_2], 50]);  // 第一波：左侧和右侧敌人同时登场
ds_queue_enqueue(enemies, [[enemy_1], 50]);         // 第二波：中间敌人在50帧后登场