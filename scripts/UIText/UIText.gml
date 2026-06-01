function UIText(str,xx,yy): UIBase(xx,yy) constructor{
	text = str;
	x = xx;
	y = yy;
	width = string_width(text);
	height = string_height(text);
	font = Lang_GetFont("zpix");
	line_spacing = 24;
	char_spacing = 0;
	halign = fa_left;
	valign = fa_top;
	
	draw = function(){
		draw_text_rich(abs_x,abs_y,text,font,-1,line_spacing,char_spacing,halign,valign,abs_scale_x,abs_scale_y,abs_alpha);
	}
}
