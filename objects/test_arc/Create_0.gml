live;
nn = 123

function draw_buff_progress(_x, _y, _progress)
{
    _progress = clamp(_progress, 0, 100);

    //========================================
    // 背景
    //========================================
    draw_sprite(
        spr_buff_crystalis,
        0,
        _x,
        _y
    );

    //========================================
    // surface
    //========================================
    static surf = -1;

    var w = 64;
    var h = 64;

    if (
        !surface_exists(surf)
        || surface_get_width(surf) != w
    ){
        surf = surface_create(w, h);
    }

    //========================================
    // 绘制到surface
    //========================================
    surface_set_target(surf);

    draw_clear_alpha(c_black, 0);

    //========================================
    // 绘制圆弧Mask
    //========================================

    gpu_set_blendmode(bm_normal);

    draw_arc(
        w * 0.5,                         // x
        h * 0.5,                         // y
        46,                              // 半径
        32,                              // 粗细（故意粗一些）
        90,                               // 起始角（正上）
        90-(_progress / 100) * 360,         // 结束角
        c_white,
        1,
        128
    );

    //========================================
    // 与边框做交集
    //========================================

    gpu_set_blendmode_ext(bm_dest_alpha, bm_zero);

    draw_sprite(
        spr_buff_crystalis,
        1,
        w * 0.5,
        h * 0.5
    );

    gpu_set_blendmode(bm_normal);

    surface_reset_target();

    //========================================
    // 绘制最终结果
    //========================================
    draw_surface(
        surf,
        _x - w * 0.5,
        _y - h * 0.5
    );
}