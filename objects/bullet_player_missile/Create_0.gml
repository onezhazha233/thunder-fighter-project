live;
event_inherited();

idle = seq_missile_ab

collision_type = COLLISION_TYPE.SPRITE

collision_effect = seq_bullet_effect_missile_a

track_inst = noone

/* —— 原版 TYPE_FOLLOW 导弹: 贝塞尔追踪(同闪电/歼灭炮) ——
   params=[2,45,135,20]: 速度20‰(t+0.02/帧), initV=20, 无固定点兜底 */
track_perm = 0.02
init_v = 20
b_t = 0
bezier_done = false
bezier_init = false
acquired = false

/* 原版索敌(WeaponBulletMgr.processTargetSelection): 未锁定时在首帧锁一次
   —— Boss 存在必锁 Boss, 否则随机屏内敌机(优先非拦截型); 无目标→永不重锁
   统一走共享函数 find_follow_target() */
