Anim_Destroy(id);

// 构造一个完全随机的路径
var start_x = x;
var start_y = y;
var end_x = irandom_range(100, 620);
var end_y = irandom_range(100, 1180);

random_path = Bezier_Path_Create(start_x, start_y, end_x, end_y);

// 随机添加 2 到 5 个中间控制点
var count = irandom_range(2, 5);
repeat(count) {
    Bezier_Path_Add_Point(random_path, irandom(720), irandom(1280));
}

// 执行路径动画 (使用 Bounce 弹跳缓动)
Anim_Path_Create(id, random_path, ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 90, 0, function(){
    // 结束回调：闪烁一下
    image_blend = c_yellow;
    Anim_Create(id, "image_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.IN, 1, -1, 30, 0, function(){
        // 闪烁完再变回来
        image_alpha = 1;
        image_blend = c_white;
    });
});