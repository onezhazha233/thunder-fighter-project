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
	per_line_align = false;

	// 缓存布局对象
	_layout = new RichTextLayout();

	// 缓存跟踪变量
	_cache_text = "";
	_cache_font = -1;
	_cache_line_spacing = 0;
	_cache_char_spacing = 0;
	_cache_halign = 0;
	_cache_valign = 0;
	_cache_per_line_align = false;

	draw = function(){
		if(nineslice == true){
			draw_sprite_nineslice(sprite,is_pressed,abs_x,abs_y,width,height,abs_scale_x,abs_scale_y,nineslice_mode,-1,abs_alpha);
		}
		else{
			draw_sprite_ext(sprite,is_pressed,abs_x,abs_y,abs_scale_x,abs_scale_y,0,-1,abs_alpha);
		}

		// 检测参数变化，只有变化时才重建布局缓存
		if (_cache_text != text || _cache_font != font ||
			_cache_line_spacing != line_spacing || _cache_char_spacing != char_spacing ||
			_cache_halign != halign || _cache_valign != valign ||
			_cache_per_line_align != per_line_align) {

			_layout.text = text;
			_layout.font = font;
			_layout.line_space = line_spacing;
			_layout.char_space = char_spacing;
			_layout.halign = halign;
			_layout.valign = valign;
			_layout.per_line_align = per_line_align;
			_layout.Invalidate();

			_cache_text = text;
			_cache_font = font;
			_cache_line_spacing = line_spacing;
			_cache_char_spacing = char_spacing;
			_cache_halign = halign;
			_cache_valign = valign;
			_cache_per_line_align = per_line_align;
		}

		_layout.Draw(
			abs_x + text_x * abs_scale_x,
			abs_y + text_y * scale_y + press_offset * abs_scale_y * is_pressed,
			abs_alpha, -1, abs_scale_x, abs_scale_y
		);
	}
}