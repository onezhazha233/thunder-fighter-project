function draw_buff_bar(surf,xx,yy,spr,image,progress,alpha=1,number=-1,number_limit=1){
    progress = clamp(progress, 0, 100);

    var w = 64;
    var h = 64;

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
        90-(progress / 100) * 360,         // 结束角
        c_white,
        1,
        128
    );

    //========================================
    // 与边框做交集
    //========================================

    gpu_set_blendmode_ext(bm_dest_alpha, bm_zero);

    draw_sprite(
        spr,
        image,
        w * 0.5,
        h * 0.5
    );

    gpu_set_blendmode(bm_normal);

    surface_reset_target();

    //========================================
    // 绘制最终结果
    //========================================
    draw_surface_ext(surf,xx - w * 0.5,yy - h * 0.5,1,1,0,-1,alpha);
	
	if(number > number_limit){
		var sl = string_length(number);
		for(var i=1;i<sl+1;i+=1){
			draw_sprite_ext(spr_buff_number,real(string_char_at(number,i)),xx+(i-sl-1)*13+30,yy-30,1,1,0,-1,alpha);
		}
	}
}