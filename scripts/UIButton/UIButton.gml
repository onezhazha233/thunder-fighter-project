function UIButton(spr,xx,yy,w,h): UIBase(xx,yy) constructor{
	press_offset = 3;//按下的时候显示的内容向下偏移的量
	text = "";
	
	sprite = spr;
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	if!(is_undefined(w))width = w;
	if!(is_undefined(h))height = h;
	nineslice = false;
	nineslice_mode = 0;
	
	text_x = 0;
	text_y = 0;
	font = Lang_GetFont("zpix");
	line_spacing = 24;
	char_spacing = 0;
	halign = fa_left;
	valign = fa_top;
	
	draw = function(){
		if(nineslice == true){
			draw_sprite_nineslice(sprite,is_pressed,abs_x,abs_y,width,height,abs_scale_x,abs_scale_y,nineslice_mode,-1,abs_alpha);
		}
		else{
			draw_sprite_ext(sprite,is_pressed,abs_x,abs_y,abs_scale_x,abs_scale_y,0,-1,abs_alpha);
		}
		draw_text_rich(abs_x+text_x*abs_scale_x,abs_y+text_y*scale_y+press_offset*abs_scale_y*is_pressed,text,font,-1,line_spacing,char_spacing,halign,valign,abs_scale_x,abs_scale_y,abs_alpha);
	}
}
