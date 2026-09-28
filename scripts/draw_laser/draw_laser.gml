// 横截面(高度=1)条带的烘焙行数。
// 取 >1 行可让线性过滤在条带上下边界都采样到相同内容, 不会出现渐隐接缝;
// 行数只影响条带纹理高度(64xN), 与激光长度无关。
#macro LASER_XSEC_BAKE_ROWS 8
// 条带缓存上限: 条数与纹理内存(字节)。超限时从队首(最久未使用)驱逐。
#macro LASER_CACHE_MAX 96
#macro LASER_CACHE_BYTES_MAX 16777216
// 同一个键的载荷连续失效多少次后放弃缓存(该键永久走旧路径), 防止"每帧新建纹理"拖垮帧率
#macro LASER_CACHE_FAIL_MAX 3

/// @function draw_laser(spr, img, xx, yy, offset, dir, length, flip, xscale, yscale, alpha, [single], [mirror], [blend])
/// @description 绘制一条基于表面平铺的、支持旋转与动态裁剪的高性能激光
///              条带按外观(精灵+帧+flip+mirror)烘焙一次, 并以**表面形式长期复用**;
///              (v9 之前每次重烘都用 sprite_create_from_surface 新建纹理, 单次 2~3ms, 是掉帧主因)
///              横截面精灵(高=1, 如 spr_bullet_enemy_laser_green/red/blue)内容与长度无关,
///              只烘焙 LASER_XSEC_BAKE_ROWS 行, 绘制时把 1 行源按 yscale=长度 拉伸 → 烘焙开销 O(1);
///              烘焙锚点逐位复刻旧版平铺公式(offset=0), 与旧版逐像素一致;
///              offset≠0 / 负缩放 / 非横截面精灵的超长裁剪等极端参数自动回退旧路径;
///              缓存宿主是持久的 laser_detector 单例(用全局实例 id 固定), 数组线性查找, LRU 驱逐
function draw_laser(_spr, _img, _xx, _yy, _offset, _dir, _length, _flip, _xscale, _yscale, _alpha, _single=false, _mirror=false, _blend=c_white) {
    // --- 变量声明(GML 的 var 必须在使用前声明, 否则赋值会落到实例变量上) ---
    var _det = noone;
    var _tmp = noone;
    var _e = noone;
    var _lru = noone;
    var _clist = noone;
    var _clen = 0;
    var _slot = -1;
    var _strip = -1;      // 缓存载荷: 烘焙条带表面(-1 = 无)
    var _surf = -1;
    var _ps = -1;         // 命中的条目里存的表面
    var _had_old = false;
    var _dead = false;    // 该键已判定不可缓存 → 本帧直接走旧路径
    var _ckey = 0;
    var _i = 0;
    var _t0 = 0;
    var _tb = 0;
    var _t1 = 0;
    var _i_max = 0;
    var _start_i = -1;
    var _msign = 1;
    var _fast = false;
    var _srcy = 0;
    var _srch = 0;
    var _src_h = 0;       // 最终绘制取样的源行数
    var _draw_ys = 1;     // 最终绘制的纵向缩放
    var _bake_h = 0;      // 条带纹理高度(源行数)
    var _bw = 64;
    var _bh = 0;
    var _need = 0;
    // --- 几何 ---
    var _w0 = sprite_get_width(_spr);
    var _h0 = sprite_get_height(_spr);
    var _frames = sprite_get_number(_spr);
    var _imgf = floor(_img);
    var _oyv = sprite_get_yoffset(_spr);
    var _w = _w0 * _xscale;
    var _h = _h0 * _yscale;
    var _half_w = _w * 0.5;
    var _w_px = max(1, ceil(abs(_w)));
    var _h_px = max(1, ceil(abs(_h)));
    var _len_px = max(1, ceil(abs(_length)));
    var _rad = 0;
    var _x_offset = 0;
    var _y_offset = 0;
    var _tf = true;
    // --- 旧路径 ---
    var _clamped_len = 0;
    var _target_w = 0;
    var _target_h = 0;
    var _count = 0;
    var _scale_x = 1;

    if (_xscale = 0 || _yscale = 0) return false;

    _t0 = get_timer();

    // 横截面精灵判定: 高=1 的精灵每一行内容完全相同, "沿长度逐行平铺"与"把唯一一行拉伸到全长"逐像素等价。
    // 旧版烘焙循环次数 = _bh div _h0 + 3, 高=1 时退化成 _bh(最大 2048) 次 draw_sprite_ext。
    var _xsec = (_h0 = 1);

    // --- 缓存宿主: 用全局实例 id 固定住持久检测器, 避免 obj.var 在不同实例间解析 ---
    if (!variable_global_exists("laser_det_id")) global.laser_det_id = noone;
    if (!instance_exists(global.laser_det_id)) {
        _tmp = noone;
        if (instance_exists(laser_detector)) _tmp = instance_find(laser_detector, 0);
        if (!instance_exists(_tmp)) {
            _tmp = instance_create_depth(0, 0, 0, laser_detector);
            _tmp.visible = false;
            _tmp.persistent = true;
            _tmp.mask_index = spr_pixel2x;
        }
        global.laser_det_id = _tmp;
    }
    _det = global.laser_det_id;
    if (!variable_instance_exists(_det, "laser_cache_list")) {
        _det.laser_cache_list = [];
        _det.laser_cache_bytes = 0;
        show_debug_message("draw_laser: surface-strip v10 active");
    }
    if (!variable_instance_exists(_det, "laser_cache_bytes")) _det.laser_cache_bytes = 0;

    // --- 统计计数器自举: 与缓存状态解耦, 防止持久实例跳过初始化导致未赋值读取 ---
    if (!variable_global_exists("draw_laser_dbg_hit")) {
        global.draw_laser_dbg_fast = 0;
        global.draw_laser_dbg_legacy = 0;
        global.draw_laser_dbg_hit = 0;
        global.draw_laser_dbg_miss = 0;
        global.draw_laser_dbg_lost = 0;
        global.draw_laser_dbg_dead = 0;
        global.draw_laser_dbg_bakes = 0;
        global.draw_laser_dbg_us = 0;
        global.draw_laser_dbg_bake_us = 0;
        global.draw_laser_dbg_legacy_us = 0;
        global.draw_laser_dbg_t = 0;
    }
    // 统计: IDE 运行/调试时自动开启(debug_mode), 正式导出静默; 每 900 次调用输出一次
    if (debug_mode) {
        global.draw_laser_dbg_t += 1;
        if (global.draw_laser_dbg_t >= 900) {
            global.draw_laser_dbg_t = 0;
            show_debug_message("draw_laser: calls=" + string(global.draw_laser_dbg_fast + global.draw_laser_dbg_legacy)
                + " fast=" + string(global.draw_laser_dbg_fast)
                + " legacy=" + string(global.draw_laser_dbg_legacy)
                + " cache=" + string(array_length(_det.laser_cache_list))
                + " hit=" + string(global.draw_laser_dbg_hit)
                + " miss=" + string(global.draw_laser_dbg_miss)
                + " lost=" + string(global.draw_laser_dbg_lost)
                + " dead=" + string(global.draw_laser_dbg_dead)
                + " bakes=" + string(global.draw_laser_dbg_bakes)
                + " bake_us=" + string(global.draw_laser_dbg_bake_us)
                + " legacy_us=" + string(global.draw_laser_dbg_legacy_us)
                + " us/call=" + string(global.draw_laser_dbg_us / max(1, global.draw_laser_dbg_fast + global.draw_laser_dbg_legacy)));
            global.draw_laser_dbg_fast = 0;
            global.draw_laser_dbg_legacy = 0;
            global.draw_laser_dbg_hit = 0;
            global.draw_laser_dbg_miss = 0;
            global.draw_laser_dbg_lost = 0;
            global.draw_laser_dbg_dead = 0;
            global.draw_laser_dbg_bakes = 0;
            global.draw_laser_dbg_us = 0;
            global.draw_laser_dbg_bake_us = 0;
            global.draw_laser_dbg_legacy_us = 0;
        }
    }

    if (_mirror) _msign = -1;

    // --- 烘焙快路径判定 ---
    // 烘焙条带逐位复刻"offset=0 时的旧版表面", 因此仅接受 offset=0 的调用;
    // 裁剪永远从第 0 行开始(_srcy=0), 不存在任何相位换算。
    if (_offset = 0 && _xscale > 0 && _yscale > 0 && _imgf >= 0 && _frames >= 1) {
        if (_single) {
            // 单块模式旧版只画 i=-1/0 两块, 可见内容 = 第 0 块在原点行以上的部分(高 = yorigin),
            // 超出部分必须留空, 且仅无 flip/mirror 时可精确复现
            if (!_flip && !_mirror) {
                _srcy = 0;
                _srch = min(_length, _oyv) / _yscale;
                if (_srch > 0 && _srch <= 2048) {
                    _fast = true;
                    _src_h = _srch;
                    _draw_ys = _yscale;
                    _bake_h = 256;
                    while (_bake_h < _srch) _bake_h *= 2;
                }
            }
        }
        else if (_xsec) {
            // ★ 横截面精灵(高=1): 条带内容与长度完全无关, 只需烘焙固定行数。
            //   旧版按 _bh div _h0 + 3 计算烘焙次数, 高=1 时退化为 ~2050 次 draw_sprite_ext
            //   (写入 64x2048 表面再 sprite_create_from_surface, 单次约 0.5MB 纹理),
            //   且 _bh 随激光长度增长 → 更长的光束出现时会二次重烘焙, 造成战斗中掉帧。
            //   现在: 恒定 LASER_XSEC_BAKE_ROWS 行(~12 次绘制) + 1 行源按 yscale=_length 拉伸,
            //   总绘制高度 = 1*_length, 与旧版 _srch*_yscale = _length 完全一致。
            _srcy = 0;
            _srch = 1; // 缓存校验只需 1 行 → 长度变化不再触发重烘焙
            if (_length > 0) {
                _fast = true;
                _src_h = 1;
                _draw_ys = _length;
                _bake_h = LASER_XSEC_BAKE_ROWS;
            }
        }
        else {
            _srcy = 0;
            _srch = _length / _yscale;
            if (_srch > 0 && _srch <= 2048) {
                _fast = true;
                _src_h = _srch;
                _draw_ys = _yscale;
                _bake_h = 256;
                while (_bake_h < _srch) _bake_h *= 2;
            }
        }
        if (_bake_h > 2048) _fast = false;
    }
    // 诊断开关:置 1 可强制走旧路径做帧率对照
    if (variable_global_exists("draw_laser_force_legacy") && global.draw_laser_force_legacy = 1) _fast = false;

    if (_fast) {
        _bw = 64;
        while (_bw < _w0) _bw *= 2;
        _bh = _bake_h;

        _clist = _det.laser_cache_list;
        _clen = array_length(_clist);
        // 外层键 = 精灵, 内层键 = 帧/flip/mirror 组合; 线性查找(缓存只有几十条, 开销可忽略)
        _ckey = (_imgf mod _frames) * 4;
        if (_flip) _ckey += 2;
        if (_mirror) _ckey += 1;
        for (_i = 0; _i < _clen; _i++) {
            _e = _clist[_i];
            if (_e.spr == _spr && _e.ckey == _ckey) {
                _slot = _i;
                _ps = _e.surf;
                if (is_undefined(_e.fail)) _e.fail = 0;
                if (_e.fail >= LASER_CACHE_FAIL_MAX) {
                    // 该键的载荷反复失效(设备重置等) → 不再重烘, 本帧直接走旧路径
                    _dead = true;
                    global.draw_laser_dbg_dead += 1;
                }
                else if (_ps != -1 && surface_exists(_ps) && !(_srcy + _srch > surface_get_height(_ps))) {
                    _strip = _ps;
                    _had_old = true;
                    _e.fail = 0;
                    global.draw_laser_dbg_hit += 1;
                }
                else {
                    // 需要重烘, 分两种情况:
                    //   1) 载荷还在但不够长 → 光束变长导致的正常重烘, 不计失败
                    //   2) 载荷真的丢了(设备重置/切后台) → 计一次失败, 连续多次则放弃该键的缓存
                    if (_ps != -1 && surface_exists(_ps)) {
                        surface_free(_ps);
                        _e.fail = 0;
                    } else {
                        global.draw_laser_dbg_lost += 1;
                        _e.fail += 1;
                    }
                    _det.laser_cache_bytes -= _e.bw * _e.bh * 4;
                    _e.surf = -1;
                    _e.bw = 0;
                    _e.bh = 0;
                    global.draw_laser_dbg_miss += 1;
                }
                break;
            }
        }
        if (!_dead) {
            if (_slot < 0) {
                global.draw_laser_dbg_miss += 1;
                // 新键: 从队首(LRU)驱逐, 直到条数与纹理内存都留出空位
                _need = _bw * _bh * 4;
                while (array_length(_clist) > 0 && (array_length(_clist) >= LASER_CACHE_MAX || _det.laser_cache_bytes + _need > LASER_CACHE_BYTES_MAX)) {
                    _tmp = _clist[0];
                    if (_tmp.surf != -1 && surface_exists(_tmp.surf)) surface_free(_tmp.surf);
                    _det.laser_cache_bytes -= _tmp.bw * _tmp.bh * 4;
                    array_delete(_clist, 0, 1);
                }
            }
            if (_det.laser_cache_bytes < 0) _det.laser_cache_bytes = 0;

            if (!_had_old) {
                // --- 烘焙: 平铺到表面。表面本身就是缓存载荷, 长期保留, 不再转成运行时精灵 ---
                _tb = get_timer();
                _surf = surface_create(_bw, _bh);
                if (_surf != -1 && surface_exists(_surf)) {
                    surface_set_target(_surf);
                    draw_clear_alpha(c_black, 0);
                    _tf = gpu_get_texfilter();
                    gpu_set_texfilter(false);
                    // 横截面(高=1)时 _h0=1 → 循环 _bh+3 次, 恰好把 LASER_XSEC_BAKE_ROWS 行全部写满(每行相同);
                    // 平铺时按 _h0 步进铺满整个条带高度
                    _i_max = (_bh div _h0) + 2;
                    _start_i = _flip ? -2 : -1;
                    // 锚点公式与旧版(offset=0)逐位一致: flip 偶数块画在 _h0*(i+1), 其余画在 _h0*i
                    for (_i = _start_i; _i <= _i_max; _i++) {
                        if (_flip && (_i mod 2 = 0)) {
                            draw_sprite_ext(_spr, _img, _w0 * 0.5, _h0 * (_i + 1), _msign, -1, 180, c_white, 1);
                        } else {
                            draw_sprite_ext(_spr, _img, _w0 * 0.5, _h0 * _i, _msign, 1, 180, c_white, 1);
                        }
                    }
                    gpu_set_texfilter(_tf);
                    surface_reset_target();
                    _strip = _surf;
                    if (_slot < 0) {
                        array_push(_clist, { spr: _spr, ckey: _ckey, surf: _strip, bw: _bw, bh: _bh, fail: 0 });
                        _slot = array_length(_clist) - 1;
                    } else {
                        _e = _clist[_slot];
                        _e.surf = _strip;
                        _e.bw = _bw;
                        _e.bh = _bh;
                    }
                    _det.laser_cache_bytes += _bw * _bh * 4;
                    global.draw_laser_dbg_bakes += 1;
                }
                global.draw_laser_dbg_bake_us += get_timer() - _tb;
            }

            if (_strip != -1 && surface_exists(_strip)) {
                // --- 最终矩阵变换与渲染:一次调用完成 ---
                _rad = degtorad(_dir - 90);
                _x_offset = cos(_rad) * _half_w;
                _y_offset = -sin(_rad) * _half_w; // GML 纵坐标向下

                // 线性过滤: 旋转+缩小的最近邻采样会周期性跳列(梁中央/边缘的 1px 暗缝),
                // 线性混合则相邻纹素参与采样, 不再跳列; 激光是辉光贴图, 轻微柔化不可见
                _tf = gpu_get_texfilter();
                gpu_set_texfilter(true);
                draw_surface_general(
                    _strip,
                    0, _srcy,
                    _w0, _src_h,   // 横截面: 1 行源(靠 _draw_ys 拉伸); 平铺/单块: _srch 行
                    _xx + _x_offset, _yy + _y_offset,
                    _xscale, _draw_ys,
                    _dir + 90,
                    _blend, _blend, _blend, _blend,
                    _alpha
                );
                gpu_set_texfilter(_tf);
                global.draw_laser_dbg_fast += 1;
                global.draw_laser_dbg_us += get_timer() - _t0;
                // LRU 触达: 把刚用过的条带移到队尾, 使满员驱逐真正淘汰"最久未使用"的条带。
                // 否则 FIFO 会把每帧都在用的热条带(如钢琴战的光束)排到队首, 周期性驱逐+重烘焙。
                _clen = array_length(_clist);
                if (_slot >= 0 && _slot < _clen - 1) {
                    _lru = _clist[_slot];
                    array_delete(_clist, _slot, 1);
                    array_push(_clist, _lru);
                }
                return true;
            }
        }
    }

    // --- 旧路径:极端参数(offset≠0/负缩放/超长裁剪)时逐帧平铺,行为与旧版完全一致 ---
    _t1 = get_timer();
    // 根据你的项目安全边界，限制最大处理长度为 1500 像素
    _clamped_len = min(1500, _len_px);

    // --- 动态表面管理（支持 2^n 显存对齐与复用） ---
    if (!variable_global_exists("draw_laser_surf")) {
        global.draw_laser_surf = -1;
        global.draw_laser_surf_w = 0;
        global.draw_laser_surf_h = 0;
    }

    // 宽度对齐到 2 的幂
    _target_w = global.draw_laser_surf_w;
    if (_target_w < _w_px) {
        _target_w = 256;
        while (_target_w < _w_px) _target_w *= 2;
    }

    // 高度对齐到 2 的幂（封顶 1500，即最高扩容到 2048 像素高度后永久复用）
    _target_h = global.draw_laser_surf_h;
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

    // --- 表面平铺绘制 ---
    _tf = gpu_get_texfilter();
    gpu_set_texfilter(false); // 关闭纹理过滤，防止像素级平铺产生缝隙

    surface_set_target(global.draw_laser_surf);
    draw_clear_alpha(c_black, 0); // 清空表面

    // 动态计算循环次数：只绘制当前阻挡距离内看得见的部分，拒绝画满整个 1500 空间
    _count = _single ? 1 : (_clamped_len div _h_px + 2);
    _start_i = _flip ? -2 : -1;

    // 预计算横向镜像缩放，避免循环内重复判断
    _scale_x = _xscale * (_mirror ? -1 : 1);

    // 横截面(高=1)精灵: 逐行平铺与"单次拉伸到全长"逐像素等价,
    // 用一次绘制替代 _clamped_len 次(例如 1460 次 → 1 次), 让旧路径对横截面激光同样廉价。
    if (_xsec && !_single && _offset = 0) {
        draw_sprite_ext(_spr, _img, _half_w, 0, _scale_x, min(_length, _target_h), 180, c_white, 1);
    }
    else {
        for (_i = _start_i; _i < _count; _i++) {
            if (_flip && (_i mod 2 = 0)) {
                draw_sprite_ext(_spr, _img, _half_w, _h * (_i + 1) + _offset, _scale_x, -_yscale, 180, c_white, 1);
            } else {
                draw_sprite_ext(_spr, _img, _half_w, _h * _i + _offset, _scale_x, _yscale, 180, c_white, 1);
            }
        }
    }
    surface_reset_target();

    // --- 最终矩阵变换与渲染 ---
    // 预计算方向向量，替代 lengthdir 函数调用，降低 CPU 三角函数开销
    _rad = degtorad(_dir - 90);
    _x_offset = cos(_rad) * _half_w;
    _y_offset = -sin(_rad) * _half_w; // GML 纵坐标向下

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

    gpu_set_texfilter(_tf); // 恢复原有的纹理过滤状态

    global.draw_laser_dbg_us += get_timer() - _t0;
    global.draw_laser_dbg_legacy_us += get_timer() - _t1;
    global.draw_laser_dbg_legacy += 1;
}
