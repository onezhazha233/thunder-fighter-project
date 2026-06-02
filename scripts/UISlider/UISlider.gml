function UISlider(xx,yy,w,h,minv,maxv,defv=0,bar_bg=spr_ui_slider_bg,knob=spr_ui_slider_knob,bar=spr_ui_slider_bar) : UIBase(xx,yy,w,h) constructor {
	value = defv;
	min_value = minv;
	max_value = maxv;
	value_step = 0;
	
	sprite_bar_bg = bar_bg;
	sprite_bar = bar;
	sprite_knob = knob;
	
	knob_padding = 20;
	
	nineslice = true;
	nineslice_mode = 1;

	static ProcessInput = function(_touch_index = 0){
		if(destroyed||abs_alpha < 0||!active||!ready) return false;
		
		var tx = device_mouse_x_to_gui(_touch_index);
		var ty = device_mouse_y_to_gui(_touch_index);
		
		if!(is_undefined(scroll_panel)){
			mouse_in_valid_region = point_in_rectangle(tx,ty,scroll_panel.abs_x,scroll_panel.abs_y,scroll_panel.abs_x+scroll_panel.abs_width*scroll_panel.scale_x,scroll_panel.abs_y+scroll_panel.abs_height*scroll_panel.scale_y);
		}

		var _child_count = array_length(children);
		for(var i = _child_count - 1; i >= 0; i--){
			if(children[i].ProcessInput(_touch_index)){
				is_pressed = false; return true; 
			}
		}
		
		var _in_bounds = point_in_rectangle(tx,ty,abs_x,abs_y,abs_x+abs_width,abs_y+abs_height);

		if(device_mouse_check_button_pressed(_touch_index,mb_left)){
			if(_in_bounds&&mouse_in_valid_region){
				is_pressed = true;
				Calculate(tx);
				return true; 
			}
		}
		
		if(is_pressed){
			Calculate(tx);
			if(device_mouse_check_button_released(_touch_index,mb_left)){
				is_pressed = false;
			}
			return true; 
		}

		return false;
	}

	static Calculate = function(_touch_x){
		var _w_p = width * abs_scale_x;
		if(_w_p <= 0) return;
		
		var _abs_padding = knob_padding * abs_scale_x;
		
		var _valid_track_length = _w_p -(_abs_padding * 2);
		if(_valid_track_length <= 0) return;
		
		var _relative_x = _touch_x -(abs_x + _abs_padding);
		
		var _pct = _relative_x / _valid_track_length;
		_pct = clamp(_pct,0.0,1.0);
		
		var _calculated = min_value + _pct *(max_value - min_value);
		
		if(value_step > 0){
			var _intervals = round((_calculated - min_value) / value_step);
			_calculated = min_value + _intervals * value_step;
			_calculated = clamp(_calculated, min_value, max_value);
		}
		
		Set(_calculated);
	}

	draw = function(){
		if(!ready||abs_alpha < 0) return;

		var _w_p = width * abs_scale_x;
		var _h_p = height * abs_scale_y;
		
		var _current_val = Get();
		var _pct =(_current_val - min_value) /(max_value - min_value);
		if(is_nan(_pct)) _pct = 0;
		
		var _abs_padding = knob_padding * abs_scale_x;
		var _valid_track_length = _w_p -(_abs_padding * 2);

		var _knob_x = abs_x + _abs_padding +(_valid_track_length * _pct);
		var _knob_y = abs_y +(_h_p * 0.5);

		if(nineslice == true){
			var _bar_bg_w = width;
			var _bar_bg_h = height;
			var _bar_w_screen = max((_pct * (_w_p - knob_padding * 2) + 16), 0);
			var _bar_h_screen = _h_p * 0.5;
			var _bar_w = _bar_w_screen / max(abs_scale_x, 0.0001);
			var _bar_h = _bar_h_screen / max(abs_scale_y, 0.0001);
			draw_sprite_nineslice(sprite_bar_bg,0,abs_x,abs_y,_bar_bg_w,_bar_bg_h,abs_scale_x,abs_scale_y,nineslice_mode,-1,abs_alpha);
			draw_sprite_nineslice(sprite_bar,0,abs_x+9*abs_scale_x,abs_y+9*abs_scale_y,_bar_w,_bar_h,abs_scale_x,abs_scale_y,nineslice_mode,-1,abs_alpha);
		}
		else{
			draw_sprite_ext(sprite_bar_bg,0,abs_x,abs_y,abs_scale_x,abs_scale_y,0,-1,abs_alpha);
			draw_sprite_ext(sprite_bar,0,abs_x,abs_y,Get()*abs_scale_x,abs_scale_y,0,-1,abs_alpha);
		}

		draw_sprite_ext(sprite_knob,0,_knob_x,_knob_y,abs_scale_x,abs_scale_y,0,c_white,abs_alpha);
	}
}
