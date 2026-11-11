live;
// 发射器销毁（敌人死亡 / 敌人被回收 / 切换房间）时，
// 本实例持有的弹幕调度随实例一起消散。此处显式释放，避免闭包残留引用。
// 注意：冻结走的是 instance_deactivate_all，不会触发 CleanUp，
// 那种情况下 Step 不跑，弹幕自然停住，恢复后继续。
if(variable_instance_exists(id, "_reps")){
	_reps = [];
	_atk_reps = [];
}
