// 1. 销毁当前物体所有动画，从当前位置开始新动画
Anim_Destroy(id);

// 2. 构造一个复杂的 S 型路径 (1个起点 + 3个控制点 + 1个终点)
/*my_path = Bezier_Path_Create(100, 100, 620, 1180); // 起点(左上) 终点(右下)
Bezier_Path_Add_Point(my_path, 800, 300);   // 控制点1：向右拉出
Bezier_Path_Add_Point(my_path, -100, 640);  // 控制点2：向左拉回中间
Bezier_Path_Add_Point(my_path, 800, 900);   // 控制点3：向右拉出

// 3. 执行路径动画 (使用 Back 缓动，带有一点冲过头的效果)
Anim_Path_Create(id, my_path, ANIM_TWEEN.BACK, ANIM_EASE.OUT, 120);

// 4. 同时执行缩放动画 (从 2倍 缩放到 4倍 再缩回)
Anim_Create(id, "image_xscale", ANIM_TWEEN.QUAD, ANIM_EASE.IN_OUT, 2, 1, 60, 0, function(){
    // 缩放回调：变大后再变小
    Anim_Create(id, "image_xscale", ANIM_TWEEN.QUAD, ANIM_EASE.IN_OUT, 3, -2, 60);
});
Anim_Create(id, "image_yscale", ANIM_TWEEN.QUAD, ANIM_EASE.IN_OUT, 2, 2, 60, 0, function(){
    Anim_Create(id, "image_yscale", ANIM_TWEEN.QUAD, ANIM_EASE.IN_OUT, 3, -2, 60);
});*/

// --- 高阶路径 (支持画外坐标) ---
var _p = Bezier_Path_Create(791, 369, 753, -89);

Bezier_Path_Add_Point(_p, 247, 822);
Bezier_Path_Add_Point(_p, 84, 438);

// 应用于动画：
Anim_Path_Create(id, _p, ANIM_TWEEN.SINE, ANIM_EASE.OUT, 120);

//Anim_Create(id,"a",0,0,0,0,0,40,function(){Anim_Pause(id,"",true);})

alarm[0] = 40