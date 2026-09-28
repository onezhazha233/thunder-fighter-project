/// @function laser_hit_player(ox, oy, dir, range, half_width)
/// @description 纯数学激光-玩家命中检测(点到线段距离),替代对玩家的 laser_find_width 二分碰撞查询
///              判定等价:激光矩形(宽 half_width*2)与玩家命中框(16x16,半宽8)相交
function laser_hit_player(_ox, _oy, _dir, _range, _half_width) {
    if (!instance_exists(player)) return false;

    var _dx = dcos(_dir);
    var _dy = -dsin(_dir);
    var _px = player.x - _ox;
    var _py = player.y - _oy;

    // 沿光束方向的投影,超出射程(含起点后方)直接排除
    var _t = _px * _dx + _py * _dy;
    if (_t < 0 || _t > _range) return false;

    // 垂直距离 = 投影残差向量长度
    var _nx = _px - _t * _dx;
    var _ny = _py - _t * _dy;
    var _r = max(1, _half_width) + 8;//玩家命中框16x16,半宽8
    return (_nx * _nx + _ny * _ny) <= _r * _r;
}
