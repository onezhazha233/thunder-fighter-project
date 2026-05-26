/// @function draw_laser(spr, img, xx, yy, offset, dir, length, flip, xscale, yscale, alpha, [single], [mirror], [blend])
/// @description 绘制一条基于表面平铺的、支持旋转与动态裁剪的高性能激光
function draw_laser(_spr, _img, _xx, _yy, _offset, _dir, _length, _flip, _xscale, _yscale, _alpha, _single=false, _mirror=false, _blend=c_white) {
    if(_xscale = 0||_yscale = 0)return false;
    // --- 1. 基础尺寸预计算 ---
    var _w = sprite_get_width(_spr) * _xscale;
    var _h = sprite_get_height(_spr) * _yscale;
    
    var _w_px = max(1, ceil(abs(_w)));
    var _h_px = max(1, ceil(abs(_h)));
    var _len_px = max(1, ceil(abs(_length))); 

    // 根据你的项目安全边界，限制最大处理长度为 1500 像素
    var _clamped_len = min(1500, _len_px);

    // --- 2. 动态表面管理（支持 2^n 显存对齐与复用） ---
    if (!variable_global_exists("draw_laser_surf")) {
        global.draw_laser_surf = -1;
        global.draw_laser_surf_w = 0;
        global.draw_laser_surf_h = 0;
    }

    // 宽度对齐到 2 的幂
    var _target_w = global.draw_laser_surf_w;
    if (_target_w < _w_px) {
        _target_w = 256;
        while (_target_w < _w_px) _target_w *= 2;
    }
    
    // 高度对齐到 2 的幂（封顶 1500，即最高扩容到 2048 像素高度后永久复用）
    var _target_h = global.draw_laser_surf_h;
    if (_target_h < _clamped_len) {
        _target_h = 256;
        while (_target_h < _clamped_len) _target_h *= 2;
    }

    // 仅在表面失效或尺寸不足时重建显存，其余情况直接复用
    if (!surface_exists(global.draw_laser_surf) || global.draw_laser_surf_w < _target_w || global.draw_laser_surf_h < _target_h) {
        if (surface_exists(global.draw_laser_surf)) surface_free(global.draw_laser_surf);
        
        global.draw_laser_surf_w = max(global.draw_laser_surf_w, _target_w);
        global.draw_laser_surf_h = max(global.draw_laser_surf_h, _target_h);
        global.draw_laser_surf = surface_create(global.draw_laser_surf_w, global.draw_laser_surf_h);
    }

    // --- 3. 表面平铺绘制（极致裁剪优化） ---
    var _texfilter = gpu_get_texfilter();
    gpu_set_texfilter(false); // 关闭纹理过滤，防止像素级平铺产生缝隙
    
    surface_set_target(global.draw_laser_surf);
    draw_clear_alpha(c_black, 0); // 清空表面

    // 动态计算循环次数：只绘制当前阻挡距离内看得见的部分，拒绝画满整个 1500 空间
    var _count = _single ? 1 : (_clamped_len div _h_px + 2);
    var _start_i = _flip ? -2 : -1;
    
    // 预计算横向镜像缩放，避免循环内重复判断
    var _scale_x = _xscale * (_mirror ? -1 : 1);
    var _half_w = _w * 0.5;

    for (var i = _start_i; i < _count; i++) {
        // 规范化布尔条件，规避旧版 GML 的单等号隐式赋值风险
        if (_flip && (i mod 2 == 0)) {
            draw_sprite_ext(_spr, _img, _half_w, _h * (i + 1) + _offset, _scale_x, -_yscale, 180, c_white, 1);
        } else {
            draw_sprite_ext(_spr, _img, _half_w, _h * i + _offset, _scale_x, _yscale, 180, c_white, 1);
        }
    }
    surface_reset_target();

    // --- 4. 最终矩阵变换与渲染 ---
    // 预计算方向向量，替代 lengthdir 函数调用，降低 CPU 三角函数开销
    var _rad = degtorad(_dir - 90);
    var _x_offset = cos(_rad) * _half_w;
    var _y_offset = -sin(_rad) * _half_w; // GML 纵坐标向下

    draw_surface_general(
        global.draw_laser_surf,
        0, 0,
        _w, _length,
        _xx + _x_offset, _yy + _y_offset,
        1, 1,
        _dir + 90,
        _blend, _blend, _blend, _blend,
        _alpha
    );
    
    gpu_set_texfilter(_texfilter); // 恢复原有的纹理过滤状态
}