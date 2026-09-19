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
	per_line_align = false;

	// 缓存布局对象
	_layout = new RichTextLayout();

	// 缓存跟踪变量（用于检测参数变化）
	_cache_text = "";
	_cache_font = -1;
	_cache_line_spacing = 0;
	_cache_char_spacing = 0;
	_cache_halign = 0;
	_cache_valign = 0;
	_cache_per_line_align = false;

	draw = function(){
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

		_layout.Draw(abs_x, abs_y, abs_alpha, -1, abs_scale_x, abs_scale_y);
	}
}