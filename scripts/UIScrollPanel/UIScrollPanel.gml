function UIScrollPanel(xx,yy,w,h): UIBase(xx,yy,w,h) constructor{
	sprite_knob = spr_ui_scroll_knob;
	
	scroll_y = 0;
	knob_width = sprite_get_width(sprite_knob);
	knob_height = sprite_get_height(sprite_knob); 
	knob_scale_x = 1;
	content_gap = 10;
	content_height = 0;
	is_scroll_panel = true;
	scroll_wheel_step = 60;
	
	children_ystart = [];
	
	press_mouse_y = mouse_y;
	velocity = 0;
	friction_air = 0.9;
	friction_out = 0.7;
	
	is_dragging_knob = false;
	knob_y = 0;
	min_y = 0;
	
	static ProcessDrag = function(ty,my){
		if(min_y < 0){
			var dist_y = 0;
			if(abs_scale_y != 0){
				dist_y = (ty - my) / abs_scale_y;
			}
				
			var max_pull_distance = 200;
			if(scroll_y > 0){
				var exceed_ratio = (scroll_y) / max_pull_distance;
				exceed_ratio = clamp(exceed_ratio,0,1);
				var dynamic_resistance = 1.0 - exceed_ratio;
				dist_y *= dynamic_resistance;
			}
			if(scroll_y < min_y){
				var exceed_ratio = (min_y - scroll_y) / max_pull_distance;
				exceed_ratio = clamp(exceed_ratio,0,1);
				var dynamic_resistance = 1.0 - exceed_ratio;
				dist_y *= dynamic_resistance;
			}
				
			scroll_y += dist_y;
			return dist_y;
		}
	}
	
	static ProcessInput = function(touch_index=0){
		if(destroyed||abs_alpha < 0||!active)return false;
		
		var al = array_length(children);
		for(var i=al-1; i>=0; i-=1){
			if(children[i].ProcessInput(touch_index)){
				is_pressed = false;
				is_dragging_knob = false; 
				touch_inside = false;
				return true; 
			}
		}
		
		var tx = device_mouse_x_to_gui(touch_index);
		var ty = device_mouse_y_to_gui(touch_index);
		var _in_bounds = point_in_rectangle(tx,ty,abs_x,abs_y,abs_x + abs_width*scale_x,abs_y + abs_height*scale_y);

		if(_in_bounds && min_y < 0){
			var _wheel_delta = 0;
			if(mouse_wheel_up()){
				_wheel_delta += scroll_wheel_step;
			}
			if(mouse_wheel_down()){
				_wheel_delta -= scroll_wheel_step;
			}
			if(_wheel_delta != 0){
				scroll_y = clamp(scroll_y + _wheel_delta,min_y,0);
				velocity = 0;
				is_pressed = false;
				is_dragging_knob = false;
				return true;
			}
		}
		
		// 只有内容可滚动时才计算 knob 相关几何
		if(min_y < 0){
			var _cur_knob_h = (height*height / content_height);
			if(scroll_y > 0){
				_cur_knob_h = max(_cur_knob_h - (scroll_y / height)*_cur_knob_h,5);
			}
			else if(scroll_y < min_y){
				_cur_knob_h = max(_cur_knob_h - ((min_y - scroll_y) / height)*_cur_knob_h,5);
			}
			
			var _knob_abs_y = abs_y + knob_y*abs_scale_y;
			var _knob_x1 = abs_x + abs_width*scale_x;
			var _knob_x2 = _knob_x1 + knob_width*abs_scale_x;
			
			var _click_y1 = max(abs_y,_knob_abs_y - 80*abs_scale_y);
			var _click_y2 = min(abs_y + height*abs_scale_y,_knob_abs_y + (_cur_knob_h + 80)*abs_scale_y);
			var _in_knob = point_in_rectangle(tx,ty,_knob_x1,_click_y1,_knob_x2,_click_y2);
		
			if(device_mouse_check_button_pressed(touch_index,mb_left)){
				if(_in_knob){
					is_dragging_knob = true;
					velocity = 0;
					press_mouse_y = ty;
					return true;
				}
				else if(_in_bounds){
					inertia = 0;
					is_pressed = true;
					touch_inside = true;
					press_mouse_y = ty;
					return true;
				}
			}
		
			if(is_dragging_knob){
				var _move_y = ty - press_mouse_y;
				press_mouse_y = ty;
				
				if(abs_scale_y != 0){
					knob_y += _move_y / abs_scale_y;
				}
				
				var _max_knob_h = height*height / content_height;
				knob_y = clamp(knob_y,0,height - _max_knob_h);
				
				if(height - _max_knob_h != 0){
					scroll_y = (knob_y / (height - _max_knob_h))*min_y;
				}
				dist_y = 0; 
			}
			else if(is_pressed){
				dist_y = ProcessDrag(ty,press_mouse_y);
				press_mouse_y = ty;
			}
			else{
				var is_out_top = (scroll_y > 0);
				var is_out_bottom = (scroll_y < min_y);
	
				if(!is_out_top&&!is_out_bottom){
					scroll_y += velocity;
					velocity *= friction_air;
					if(abs(velocity) < 0.1) velocity = 0;
				}
				else{
					if((is_out_top&&velocity > 1)||(is_out_bottom&&velocity < -1)){
						scroll_y += velocity;
						velocity *= friction_out;
					}
					else{
						velocity = 0;
						if(is_out_top){
							scroll_y = lerp(scroll_y,0,0.25);
							if(scroll_y < 0.5) scroll_y = 0;
						}
						else if(is_out_bottom){
							scroll_y = lerp(scroll_y,min_y,0.25);
							if(abs(scroll_y - min_y) < 0.5) scroll_y = min_y;
						}
					}
				}
			}
		
			if(device_mouse_check_button_released(touch_index,mb_left)){
				if(is_dragging_knob){
					is_dragging_knob = false;
					return true;
				}
				if(is_pressed){
					is_pressed = false;
					
					if(scroll_y > 0||scroll_y < min_y){
						velocity = 0; 
					}
					else{
						velocity = clamp(dist_y,-50,50);
					}
					return true;
				}
			}
		}
	}
	
	static InitChildrenY = function(){
		children_ystart = [];
		content_height = content_gap;
		var al = array_length(children);
		for(var i=0; i<al; i+=1){
			children_ystart[i] = content_height;
			content_height += children[i].height;
			content_height += content_gap;
		}
	}
	
	static UpdatePosition = function(){
		if(parent == -1){
			abs_x = x;
			abs_y = y;
			abs_width = width;
			abs_height = height;
			abs_scale_x = scale_x;
			abs_scale_y = scale_y;
			abs_alpha = alpha;
			if(center == true){
				abs_x -= width*scale_x/2;
				abs_y -= height*scale_y/2;
			}
		}
		else{
			abs_x = parent.abs_x + (x*parent.abs_scale_x);
			abs_y = parent.abs_y + (y*parent.abs_scale_y);
			abs_width = width*parent.abs_scale_x;
			abs_height = height*parent.abs_scale_y;
			abs_scale_x = parent.abs_scale_x*scale_x;
			abs_scale_y = parent.abs_scale_y*scale_y;
			abs_alpha = parent.abs_alpha*alpha;
			if(center == true){
				abs_x -= abs_width/2;
				abs_y -= abs_height/2;
			}
		}
		if(ready == true){
			var al = array_length(children);
			for(var i=0; i<al; i+=1){
				children[i].y = children_ystart[i] + scroll_y;
			}
			min_y = min(-(content_height - height),0);
		}
		var al = array_length(children);
		for(var i=0; i<al; i+=1){
			children[i].UpdatePosition();
		}
		if(ready == false){
			ready = true;
			CallEvent(UI_EVENT.CREATE);
			InitChildrenY();
		}
	}
	
	static Draw = function(){
		if(destroyed||abs_alpha <= 0||!active)return;
		if(!is_undefined(draw)) draw();

		var old_scissor = gpu_get_scissor();
		gpu_set_scissor(abs_x,abs_y,abs_width*scale_x,abs_height*scale_y);

		// 裁剪：跳过完全在可视区域外的子组件
		var _clip_top = abs_y;
		var _clip_bot = abs_y + abs_height * abs_scale_y;
		var al = array_length(children);
		for(var i=0; i<al; i+=1){
			var _child = children[i];
			if (_child.abs_y + _child.abs_height * _child.abs_scale_y < _clip_top) continue;
			if (_child.abs_y > _clip_bot) continue;
			_child.Draw();
		}
		gpu_set_scissor(old_scissor);
		
		var _base_knob_h = height*height / content_height;
		knob_height = max(_base_knob_h,14);
		
		// ---- 横向反馈参数(用法见下面"横向: 中心固定 + 左右对称的挤压/变宽") ----
		// idle = 0.9 是关键: 0.9*20 = 18px, 正好等于九宫格左右边框之和(9+9)。
		// 请求宽度一旦小于它, draw_sprite_nineslice 会把不足的宽度全部补到右边,
		// 画出来的矩形就偏右、且跨过 18px 时会跳一下 —— 这就是"看着往左偏"的根源。
		var _knob_sc_idle  = 0.9;
		var _knob_sc_press = 1.0;
		var _knob_sc_max   = 1.15;
		
		if(!is_dragging_knob){
			if(min_y != 0){
				knob_y = clamp((scroll_y / min_y)*(height - _base_knob_h),0,height - _base_knob_h);
			}
			else{
				knob_y = 0;
			}
			
			if(scroll_y > 0){
				var overflow = (scroll_y / height)*_base_knob_h;
				knob_height = max(_base_knob_h - overflow,14);
				knob_y = 0;
				knob_scale_x = min(knob_scale_x + overflow / 500, _knob_sc_max);   // 过界: 再对称地鼓一点点(有上限)
			} 
			else if(scroll_y < min_y){
				var overflow = ((min_y - scroll_y) / height)*_base_knob_h;
				knob_height = max(_base_knob_h - overflow,14);
				knob_y = height - knob_height;
				knob_scale_x = min(knob_scale_x + overflow / 500, _knob_sc_max);   // 过界: 再对称地鼓一点点(有上限)
			}
		}

		// ---- 横向: 中心固定 + 左右对称的挤压/变宽 ----
		// knob_x 是按"固定中心"摆放的: 中心 = 面板右缘 + knob_width/2*abs_scale_x, 与 knob_scale_x 无关,
		// 所以只要请求宽度能被九宫格原样画出(即 knob_scale_x >= _knob_sc_idle), 变宽/收窄就是
		// 左右对称的, 中心永远钉在原位 —— 既保留挤压反馈, 又不会出现"往左偏"。
		if(is_pressed||is_dragging_knob){
			knob_scale_x = lerp(knob_scale_x, _knob_sc_press, 0.34);
		}
		else{
			knob_scale_x = lerp(knob_scale_x, _knob_sc_idle, 0.34);
		}
		knob_scale_x = clamp(knob_scale_x, _knob_sc_idle, _knob_sc_max);
		knob_x = abs_x + abs_width*scale_x + (knob_width*(1 - knob_scale_x)) / 2*abs_scale_x;

		if(min_y < 0)draw_sprite_nineslice(sprite_knob,0,knob_x,abs_y+knob_y*abs_scale_y,knob_width*knob_scale_x,knob_height,abs_scale_x,abs_scale_y,,,abs_alpha);
		
		if(global.ui_showbox == true){
			draw_rectangle_color(abs_x,abs_y,abs_x + abs_width*scale_x,abs_y + abs_height*scale_y,c_yellow,c_yellow,c_yellow,c_yellow,true);
			
			var _debug_y1 = max(abs_y,abs_y + knob_y*abs_scale_y - 80*abs_scale_y);
			var _debug_y2 = min(abs_y + height*abs_scale_y,abs_y + (knob_y + knob_height)*abs_scale_y + 80*abs_scale_y);
			draw_rectangle_color(abs_x + abs_width*scale_x,_debug_y1,abs_x + abs_width*scale_x + knob_width*abs_scale_x,_debug_y2,c_red,c_red,c_red,c_red,true);
		}
	}
	
	static RemoveChild = function(index){
		if(is_struct(index)){
			var al = array_length(children);
			for(var i=0; i<al; i+=1){
				if(children[i] == index){
					array_delete(children,i,1);
					InitChildrenY();
					return;
				}
			}
			return;
		}
		
		if(is_real(index)){
			array_delete(children,index,1);
			InitChildrenY();
		}
	}
}