function UIInit(){
	global.ui_showbox = 0;
	Anim_Init()
	enum UI_EVENT {
		CREATE,   // 组件第一帧创建完成
		DESTROY,  // 组件被销毁
		CLICK,	// 组件被安全点击并松开
		CHANGE	// 内部数值 value 变更
	}
}