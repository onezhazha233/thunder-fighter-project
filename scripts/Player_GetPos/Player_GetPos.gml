function Player_GetPos(){
	// 玩家死亡时实例并不销毁(player/Step_0.gml 的 instance_destroy 被注释掉),
	// 只是 visible=false 且移动逻辑只在 visible=true 时执行, 所以 x/y 会冻结在死亡位置。
	// 这里用 instance_exists 而不是 Player_IsEnabled(后者要求 equipment 存在,
	// 死亡时会销毁 equipment_main), 这样死亡后的瞄准弹会锁定死亡位置;
	// 没有玩家实例时(准备界面预览等)仍退回鼠标坐标。
	if(instance_exists(player)){
		return [player.x,player.y];
	}
	return [mouse_x,mouse_y];
}
