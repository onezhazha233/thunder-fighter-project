/// @func Hash01(_n)  整数 -> [0,1) 均匀分布
/// @desc 确定性伪随机。同样的输入永远得到同样的输出，无需管理状态。
///
/// 注意：不要用裸 xorshift32 处理连续小整数（1,2,3...）。
/// 那种输入左移后会直接溢出到 0，导致输出全部挤在 0 附近
/// —— 实测前 300 个整数的输出都小于 0.02，看起来就像"一直是 0"。
/// 这里先把输入按位折叠到 32 位，再用 fract(sin) 做混合，分布才是均匀的。
function Hash01(_n){
    // 折叠到 32 位：位运算是精确的，大输入也不会丢低位
    var _x = _n & 0xffffffff;
    _x = _x ^ (_x >> 16);

    // GLSL 常用的 fract(sin) 混合：sin 的微小差异被乘大数放大后取小数部分，
    // 结果在 [0,1) 上近似均匀
    var _v = sin(_x * 12.9898) * 43758.5453;
    return _v - floor(_v);
}

/// @func HashRange(_n, _min, _max)
/// @desc 把 Hash01 映射到指定区间，等价于 _min + Hash01(_n) * (_max - _min)
function HashRange(_n, _min, _max){
    return _min + Hash01(_n) * (_max - _min);
}
