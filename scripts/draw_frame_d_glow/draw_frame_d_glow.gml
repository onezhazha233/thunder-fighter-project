function eval_curve(points, t){
    var n = array_length(points);
    var seg = 0;
    while (seg < n - 1 && points[seg + 1][0] < t) seg++;
    if (seg >= n - 1) seg = n - 2;
        
    var x0 = points[seg][0];
    var x1 = points[seg + 1][0];
    var len = x1 - x0;
    var lt = (len > 0) ? clamp((t - x0) / len, 0, 1) : 0;
        
    var p0 = points[seg][1];
    var p1 = points[seg + 1][1];
    var c0 = p0 + points[seg][5];      // tv1 出向切线
    var c1 = p1 + points[seg + 1][4];   // tv0 入向切线
        
    var u = 1 - lt;
    return u*u*u*p0 + 3*u*u*lt*c0 + 3*u*lt*lt*c1 + lt*lt*lt*p1;
}
    
// 线性插值 Alpha（应用全局 alpha_mult）
function lerp_alpha(f, kfs){
    var a = kfs[0][1];
    for (var i = 0; i < array_length(kfs) - 1; i++)
    {
        if (f >= kfs[i][0] && f <= kfs[i + 1][0])
        {
            var t = (f - kfs[i][0]) / (kfs[i + 1][0] - kfs[i][0]);
            a = lerp(kfs[i][1], kfs[i + 1][1], t);
            break;
        }
    }
    return clamp(a, 0, 1);
}

function draw_frame_d_glow(frame, x_offset = 0, y_offset = 0, scale_mult = 1.0, alpha_mult = 1.0)
{
    
    // ================= 曲线数据（保持原样） =================
    
    var curve_scale_x = [
        [0.0, 0.5, -0.05185185, 0, 0.25925925, 0],
        [0.5185185, 1.0, 0, 0, 0, 0],
        [0.962963, 0.5, -0.22222224, 0, 0.007407403, 0],
        [1.0, 0.5, -0.007407403, 0, 0, 0]
    ];
    
    var curve_scale_y = [
        [0.0, 1.0, 0, 0, 0.1037037, 0], 
        [0.5185185, 1.0, -0.1037037, 0, 0.0888889, 0], 
        [0.962963, 1.0, -0.0888889, 0, 0.007407403, 0], 
        [1.0, 1.0, -0.007407403, 0, 0, 0]
    ];
    
    var curve_pos1_y = [[0,12,0,0,0.38518512,0],[0.9629628,132,-0.38518512,0,0.007407439,0],[1,132,-0.007407439,0,0,0]];
    var curve_pos2_x = [[0,142,0,0,0.19999924,0],[0.9999962,142,-0.19999924,0,0,0]];
    var curve_pos2_y = [[0,12,0,0,-0.04999981,0],[0.9999962,132,0.04999981,0,0.04999981,0],[1,132,-0.04999981,0,0,0]];
    var curve_pos3_x = [[0,12,0,0,-0.04814815,0],[0.962963,132,0.04814815,0,-0.3851852,0],[1,120,0.3851852,0,-0.007407403,0]];
    var curve_pos3_y = [[0,2,0,0,0.1925926,0],[0.962963,2,-0.1925926,0,0.007407403,0],[1,2,-0.007407403,0,0,0]];
    var curve_pos4_x = [[0,12,0,0,-0.05,0],[1,132,0.05,0,0.05,0]];
    var curve_pos4_y = [[0,142,0,0,0.2,0],[1,142,-0.2,0,0,0]];
    
    var kf_alpha0 = [[0,0],[34,1],[62,0],[86,0]];
    var kf_alpha1 = [[36,0],[45,1],[50,1],[62,0]];
    var kf_alpha2 = [[60,0],[69,1],[74,1],[86,0]];
    
    // ================= 绘制逻辑 =================
    
    var spr_glow = spr_icon_frame_d_glow;
    var c_blend = c_white;
    
    // --- 轨道 1: 静态基底 (0~86帧) ---
    if (frame >= 0 && frame <= 86)
    {
        var base_alpha = lerp_alpha(frame, kf_alpha0)*alpha_mult;
        draw_sprite_ext(spr_glow, 0, 8 + x_offset, 8 + y_offset, 1 * scale_mult, 1 * scale_mult, 0, c_blend, base_alpha);
    }
    
    // --- 轨道 2: 起始 36, 长度 26 ---
    if (frame >= 36 && frame < 62)
    {
        var t = (frame - 36) / 26.0;
        var px = 2.0*scale_mult + x_offset;
        var py = eval_curve(curve_pos1_y, t)*scale_mult + y_offset;
        var sx = eval_curve(curve_scale_x, t) * scale_mult;
        var sy = eval_curve(curve_scale_y, t) * scale_mult;
        draw_sprite_ext(spr_glow, 1, px, py, sx, sy, 90, c_blend, lerp_alpha(frame, kf_alpha1)*alpha_mult);
    }
    
    // --- 轨道 3: 起始 60, 长度 26 ---
    if (frame >= 60 && frame < 86)
    {
        var t = (frame - 60) / 26.0;
        var px = eval_curve(curve_pos2_x, t)*scale_mult + x_offset;
        var py = eval_curve(curve_pos2_y, t)*scale_mult + y_offset;
        var sx = eval_curve(curve_scale_x, t) * scale_mult;
        var sy = eval_curve(curve_scale_y, t) * scale_mult;
        draw_sprite_ext(spr_glow, 1, px, py, sx, sy, 90, c_blend, lerp_alpha(frame, kf_alpha2)*alpha_mult);
    }
    
    // --- 轨道 4: 起始 36, 长度 26 ---
    if (frame >= 36 && frame < 62)
    {
        var t = (frame - 36) / 26.0;
        var px = eval_curve(curve_pos3_x, t)*scale_mult + x_offset;
        var py = eval_curve(curve_pos3_y, t)*scale_mult + y_offset;
        var sx = eval_curve(curve_scale_x, t) * scale_mult;
        var sy = eval_curve(curve_scale_y, t) * scale_mult;
        draw_sprite_ext(spr_glow, 1, px, py, sx, sy, 0, c_blend, lerp_alpha(frame, kf_alpha1)*alpha_mult);
    }
    
    // --- 轨道 5: 起始 60, 长度 26 ---
    if (frame >= 60 && frame < 86)
    {
        var t = (frame - 60) / 26.0;
        var px = eval_curve(curve_pos4_x, t)*scale_mult + x_offset;
        var py = eval_curve(curve_pos4_y, t)*scale_mult + y_offset;
        var sx = eval_curve(curve_scale_x, t) * scale_mult;
        var sy = eval_curve(curve_scale_y, t) * scale_mult;
        draw_sprite_ext(spr_glow, 1, px, py, sx, sy, 0, c_blend, lerp_alpha(frame, kf_alpha2)*alpha_mult);
    }
}