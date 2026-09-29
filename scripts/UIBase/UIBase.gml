function UIBase(xx=0,yy=0,w=100,h=100) constructor{
	parent = -1;
	children = [];
	
	x = xx;
	y = yy;
	width = w;
	height = h;
	scale_x = 1;
	scale_y = 1;
	alpha = 1;
	
	abs_x = x;
	abs_y = y;
	abs_width = width;
	abs_height = height;
	abs_scale_x = scale_x;
	abs_scale_y = scale_y;
	abs_alpha = alpha;
	
	center = false;
	
	step = undefined;
	draw = undefined;
	
	destroyed = false;
	ready = false;
	active = true;   // 输入闸门: false = 不参与命中, 但照常绘制(窗口打开动画期间就是用它挡输入)
	visible = true;  // 总开关: false = 既不绘制也不参与命中
	
	is_pressed = false;
	touch_inside = false;
	press_mouse_x = 0;
	press_mouse_y = 0;
	first_press_x = 0;
	first_press_y = 0;
	
	dismiss_on_outside = false; // true: 在组件范围之外完成一次安全点击时抛出 UI_EVENT.DISMISS(模态窗用)
	outside_press = false;      // 本次按压是否起始于组件范围之外
	
	scroll_panel = undefined;
	mouse_in_valid_region = true;
	
	events = {};
	
	// ---- 尺寸 / 命中 的统一入口 ----
	// abs_width / abs_height 不是像素尺寸: 它们已经含了父级缩放, 但还没乘自己的 scale_x / scale_y。
	// "像素宽高 / 右边界 / 下边界 / 是否命中"一律走下面这几个方法, 不要各处手写 abs_width*scale_x ——
	// 历史上就因为漏乘、或错用 abs_scale_* 出过 4 处不一致(其中一处与 gpu_set_scissor 的裁剪区都不一致)。
	static PixelWidth = function(){
		return abs_width*scale_x;
	}
	
	static PixelHeight = function(){
		return abs_height*scale_y;
	}
	
	static Right = function(){
		return abs_x + abs_width*scale_x;
	}
	
	static Bottom = function(){
		return abs_y + abs_height*scale_y;
	}
	
	static InBounds = function(tx,ty){
		return point_in_rectangle(tx,ty,abs_x,abs_y,abs_x + abs_width*scale_x,abs_y + abs_height*scale_y);
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
				abs_x -= PixelWidth()/2;
				abs_y -= PixelHeight()/2;
			}
		}
		else{
			abs_x = parent.abs_x + (x * parent.abs_scale_x);
			abs_y = parent.abs_y + (y * parent.abs_scale_y);
			abs_width = width*parent.abs_scale_x;
			abs_height = height*parent.abs_scale_y;
			abs_scale_x = parent.abs_scale_x * scale_x;
			abs_scale_y = parent.abs_scale_y * scale_y;
			abs_alpha = parent.abs_alpha * alpha;
			
			if(center == true){
				abs_x -= PixelWidth()/2;
				abs_y -= PixelHeight()/2;
			}
		}
		var al = array_length(children);
		for(var i=0;i<al;i+=1){
			children[i].UpdatePosition();
		}
		scroll_panel = undefined;
		var _ancestor = parent;
		while(is_struct(_ancestor)){
			if(variable_struct_exists(_ancestor,"is_scroll_panel")&&_ancestor.is_scroll_panel == true){
				scroll_panel = _ancestor;
				break;
			}
			_ancestor = _ancestor.parent;
		}
		if(ready == false){
			ready = true;
			CallEvent(UI_EVENT.CREATE);
		}
	}
	
	static Update = function(){
		if (!is_undefined(step))step(self);
		var al = array_length(children);
		for(var i=0;i<al;i+=1){
			children[i].Update();
		}
	}
	
	static ProcessInput = function(touch_index=0){
		// visible = 总开关(不绘制也不命中); active = 输入闸门(不命中但照常绘制, 窗口开合动画用);
		// alpha 只影响显示, 全透明的不该还能被点到
		if(destroyed||!visible||abs_alpha <= 0||!active||!ready)return false;
		
		// 无鼠标事件时跳过子树遍历（不检测滚轮，滚轮由 UIScrollPanel 自行处理）
		if(!device_mouse_check_button(touch_index,mb_left)&&!device_mouse_check_button_pressed(touch_index,mb_left)&&!device_mouse_check_button_released(touch_index,mb_left)){
			var al = array_length(children);
			for(var i=al-1;i>=0;i-=1){
				if(children[i].ProcessInput(touch_index)) return true;
			}
			return false;
		}
		
		var tx = device_mouse_x_to_gui(touch_index);
		var ty = device_mouse_y_to_gui(touch_index);
		
		if!(is_undefined(scroll_panel)){
			mouse_in_valid_region = scroll_panel.InBounds(tx,ty);
		}
		
		var al = array_length(children);
		for(var i=al-1;i>=0;i-=1){
			if(children[i].ProcessInput(touch_index)){
				is_pressed = false;
				touch_inside = false;
				return true; 
			}
		}
		
		var _in_bounds = InBounds(tx,ty);
		
		if(device_mouse_check_button_pressed(touch_index,mb_left)){
			if(_in_bounds&&mouse_in_valid_region){
				is_pressed = true;
				touch_inside = true;
				outside_press = false;
				press_mouse_x = tx;
				press_mouse_y = ty;
				first_press_x = tx;
				first_press_y = ty;
				return true;
			}
			else if(dismiss_on_outside&&mouse_in_valid_region){
				// 点在组件范围之外: 先吃掉这次按压(不穿透到下层), 等松开时再判定是否算一次"外部点击"
				is_pressed = true;
				touch_inside = false;
				outside_press = true;
				press_mouse_x = tx;
				press_mouse_y = ty;
				first_press_x = tx;
				first_press_y = ty;
				return true;
			}
		}
		
		if(is_pressed){
			var _drag_dist = point_distance(tx,ty,first_press_x,first_press_y);
			if(!is_undefined(scroll_panel)){
				scroll_panel.dist_y = scroll_panel.ProcessDrag(ty,press_mouse_y);
				if(_drag_dist >= 5||!mouse_in_valid_region){
					is_pressed = false;
					touch_inside = false;
					scroll_panel.is_pressed = true;
					scroll_panel.press_mouse_y = ty;
					return false;
				}
			}
			touch_inside = _in_bounds;
			
			if(device_mouse_check_button_released(touch_index,mb_left)){
				is_pressed = false;
				if(touch_inside&&mouse_in_valid_region){
					touch_inside = false;
					CallEvent(UI_EVENT.CLICK);
				}
				else if(outside_press&&dismiss_on_outside&&mouse_in_valid_region){
					// 按下与松开都落在组件范围之外 → 视为"点击组件外", 抛出 DISMISS 让窗口自己决定关不关
					CallEvent(UI_EVENT.DISMISS);
				}
				outside_press = false;
				if(!is_undefined(scroll_panel)){
					scroll_panel.is_pressed = false;
					scroll_panel.velocity = scroll_panel.ProcessDrag(ty,press_mouse_y);
				}
				return true;
			}
		}
		press_mouse_x = tx;
		press_mouse_y = ty;
		return false;
	}
	
	static Draw = function(){
		if(!visible||abs_alpha <= 0)return; // 全透明/不可见时连子树一起跳过, 省掉整棵子树的遍历与绘制调用
		if!(is_undefined(scroll_panel)){
			if!(rectangle_in_rectangle(abs_x,abs_y,Right(),Bottom(),scroll_panel.abs_x,scroll_panel.abs_y,scroll_panel.Right(),scroll_panel.Bottom()))return false;
		}
		if!(is_undefined(draw))draw(self);
		var al = array_length(children);
		for(var i=0;i<al;i+=1){
			children[i].Draw();
		}
		if(global.ui_showbox == true) draw_rectangle_color(abs_x, abs_y, Right(), Bottom(), c_yellow, c_yellow, c_yellow, c_yellow, 1);
	}
	
	static Destroy = function(){
		if(destroyed) return;

		var _children = children;
		children = [];
		destroyed = true;
		ready = false;

		var al = array_length(_children);
		for(var i=0; i<al; i+=1){
			_children[i].Destroy();
		}
		
		if(!is_undefined(parent)&&is_struct(parent)){
			parent.RemoveChild(self);
		}

		CallEvent(UI_EVENT.DESTROY);
		parent = undefined;
	}
	
	static RemoveChild = function(child){
		if(destroyed) return;

		var al = array_length(children);
		for(var i=0;i<al;i+=1){
			if(children[i] == child){
				array_delete(children,i,1);
				break;
			}
		}
	}
	
	static AddContent = function(content){
		if(is_array(content)){
			var al = array_length(content);
			for(var i=0;i<al;i+=1){
				content[i].parent = self;
				array_push(children,content[i]);
				content[i].UpdatePosition();
			}
		}
		else{
			content.parent = self;
			array_push(children,content);
			content.UpdatePosition();
		}
	}
	
	static AddEvent = function(type,func){
		if!(variable_struct_exists(events,type)){
			events[$ type] = [];
		}
		// 同时保存两份:
		//   fn  → 绑定到本组件的方法, 供 CallEvent 调用(method() 每次都新建绑定, 必须存下来复用)
		//   src → 调用者传入的原始函数, 供 RemoveEvent 做同一性比较
		// 之前只存 method(self,func), 而 RemoveEvent 拿它去和裸 func 比 —— 永远不相等, 所以删不掉。
		array_push(events[$ type],{ fn: method(self,func), src: func });
	}
	
	/// 注销事件。func 必须与 AddEvent 时传入的是同一个函数值
	/// (具名函数, 或调用者自己存下来的引用; 内联匿名函数无法再取到同一个值)。
	/// 同一函数注册多次时只移除最先命中的一条。
	static RemoveEvent = function(type,func){
		if(variable_struct_exists(events,type)){
			var al = array_length(events[$ type]);
			for(var i=0;i<al;i+=1){
				if(events[$ type][i].src == func){
					array_delete(events[$ type],i,1);
					break;
				}
			}
		}
	}
	
	static CallEvent = function(type,arg0=0,arg1=0){
		var al = array_length(events[$ type]);
		for(var i=0;i<al;i+=1){
			// 派发途中可能被 RemoveEvent 注销(现在真的能注销了), 数组会变短, al 已过期
			if(i >= array_length(events[$ type]))break;
			var _e = events[$ type][i];
			_e.fn(self,arg0,arg1);
		}
	}
	
	static Set = function(v){
		if (value != v){
			old = value;
			value = v;
			CallEvent(UI_EVENT.CHANGE,value,old);
		}
	}
	
	static Get = function(){
		return value;
	}
}