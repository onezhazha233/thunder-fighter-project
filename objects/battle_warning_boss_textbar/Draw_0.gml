live;
draw_set_font(Lang_GetFont("zpix"))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_sprite_ext(spr_ui_warning_boss_textbar,0,x,y,image_xscale,image_yscale,0,-1,image_alpha)
if(lv_spr = true){
	var _cx = x-260*image_xscale;
	var _tw = string_width("LV.")*image_xscale;
	var _sw = sprite_get_width(lv)*image_xscale;
	var _sh = sprite_get_height(lv)*image_yscale;
	var _left = _cx-(_tw+_sw)/2;
	draw_text_transformed_color(_left+_tw/2,y,"LV.",image_xscale,image_yscale,0,-1,-1,-1,-1,image_alpha);
	draw_sprite_stretched_ext(lv,lv_spr_img,_left+_tw,y-_sh/2,_sw,_sh,-1,image_alpha);
}
else{
	draw_text_transformed_color(x-260*image_xscale,y,"LV."+string(lv),image_xscale,image_yscale,0,-1,-1,-1,-1,image_alpha);
}
draw_text_transformed_color(x+150*image_xscale,y,name,image_xscale,image_yscale,0,-1,-1,-1,-1,image_alpha)
draw_set_halign(fa_left)
draw_set_valign(fa_top)