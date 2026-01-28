// 初始属性
image_xscale = 1;
image_yscale = 1;
image_blend = c_white;
image_alpha = 1;

xp = x
yp = y

a = 0

show_debug_message("点击屏幕左键：演示 S 型多点贝塞尔路径 + 缩放");
show_debug_message("点击屏幕右键：演示 随机乱飞路径 + 颜色渐变");

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

/// @desc 预览贝塞尔路径
/// @param _path_obj 路径对象
/// @param _precision 采样精度 (建议 20-50)，值越高越平滑
/// @param _color 曲线颜色
/// @param _show_handles 是否显示控制点手柄
function Bezier_Path_Draw_Debug(_path_obj, _precision = 30, _color = c_yellow, _show_handles = true) {
    var _last_x = _path_obj.start_point[0];
    var _last_y = _path_obj.start_point[1];
    
    // 1. 绘制曲线主体
    draw_set_color(_color);
    for (var i = 1; i <= _precision; i++) {
        var _t = i / _precision;
        // 调用之前的内部求解器获取坐标
        var _pos = _Bezier_Solver_Internal(_path_obj, _t);
        
        draw_line_width(_last_x, _last_y, _pos[0], _pos[1], 2);
        
        _last_x = _pos[0];
        _last_y = _pos[1];
    }

    // 2. 绘制控制点和手柄 (类似 PS 钢笔工具)
    if (_show_handles) {
        var _pts = [];
        array_push(_pts, _path_obj.start_point);
        for (var i = 0; i < array_length(_path_obj.controls); i++) {
            array_push(_pts, _path_obj.controls[i]);
        }
        array_push(_pts, _path_obj.end_point);

        for (var i = 0; i < array_length(_pts); i++) {
            var _px = _pts[i][0];
            var _py = _pts[i][1];
            
            // 画点
            if (i == 0 || i == array_length(_pts) - 1) {
                draw_circle(_px, _py, 5, false); // 起点和终点是实心圆
            } else {
                draw_rectangle(_px - 3, _py - 3, _px + 3, _py + 3, false); // 控制点是方块
            }
            
            // 画虚线连接各个控制点
            if (i > 0) {
                draw_set_alpha(0.3);
                draw_line(_pts[i-1][0], _pts[i-1][1], _px, _py);
                draw_set_alpha(1.0);
            }
        }
    }
    draw_set_color(c_white);
}