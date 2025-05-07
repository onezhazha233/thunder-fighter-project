live;
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_sprite_ext(spr_ui_warning_boss_textbar,0,x,y,image_xscale,image_yscale,0,-1,image_alpha)
draw_text_transformed_color(x-260*image_xscale,y,"LV."+string(lv),image_xscale,image_yscale,0,-1,-1,-1,-1,image_alpha)
draw_text_transformed_color(x+150*image_xscale,y,name,image_xscale,image_yscale,0,-1,-1,-1,-1,image_alpha)
draw_set_halign(fa_left)
draw_set_valign(fa_top)