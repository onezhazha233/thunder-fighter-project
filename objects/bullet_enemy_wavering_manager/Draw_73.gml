live;
/// 重叠绘制与伤害判定都放在 Draw 事件里(见 Draw_0), 不使用 Draw End:
/// 这样红色重叠区画在圆环之上、ITEM_EFFECTS 与 UI 之下, 不会糊住 HUD。
