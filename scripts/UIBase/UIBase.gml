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
	active = true;
	
	is_pressed = false;
	touch_inside = false;
	press_mouse_x = 0;
	press_mouse_y = 0;
	first_press_x = 0;
	first_press_y = 0;
	
	scroll_panel = undefined;
	mouse_in_valid_region = true;
	
	events = {};
	
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
			abs_x = parent.abs_x + (x * parent.abs_scale_x);
			abs_y = parent.abs_y + (y * parent.abs_scale_y);
			abs_width = width*parent.abs_scale_x;
			abs_height = height*parent.abs_scale_y;
			abs_scale_x = parent.abs_scale_x * scale_x;
			abs_scale_y = parent.abs_scale_y * scale_y;
			abs_alpha = parent.abs_alpha * alpha;
			
			if(center == true){
				abs_x -= abs_width*scale_x/2;
				abs_y -= abs_height*scale_y/2;
			}
		}
		var al = array_length(children);
		for(i=0;i<al;i+=1){
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
		for(i=0;i<al;i+=1){
			children[i].Update();
		}
	}
	
	static ProcessInput = function(touch_index=0){
		if(destroyed||abs_alpha < 0||!active||!ready)return false;
		
		var tx = device_mouse_x_to_gui(touch_index);
		var ty = device_mouse_y_to_gui(touch_index);
		
		if!(is_undefined(scroll_panel)){
			mouse_in_valid_region = point_in_rectangle(tx,ty,scroll_panel.abs_x,scroll_panel.abs_y,scroll_panel.abs_x+scroll_panel.abs_width*scroll_panel.scale_x,scroll_panel.abs_y+scroll_panel.abs_height*scroll_panel.scale_y);
		}
		
		var al = array_length(children);
		for(i=al-1;i>=0;i-=1){
			if(children[i].ProcessInput(touch_index)){
				is_pressed = false;
				touch_inside = false;
				return true; 
			}
		}
		
		var _in_bounds = point_in_rectangle(tx,ty,abs_x,abs_y,abs_x+abs_width*scale_x,abs_y+abs_height*scale_y);
		
		if(device_mouse_check_button_pressed(touch_index,mb_left)){
			if(_in_bounds&&mouse_in_valid_region){
				is_pressed = true;
				touch_inside = true;
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
		if(abs_alpha < 0)return;
		if!(is_undefined(scroll_panel)){
			if!(rectangle_in_rectangle(abs_x,abs_y,abs_x+abs_width*scale_x,abs_y+abs_height*scale_y,scroll_panel.abs_x,scroll_panel.abs_y,scroll_panel.abs_x+scroll_panel.abs_width*scroll_panel.scale_x,scroll_panel.abs_y+scroll_panel.abs_height*scroll_panel.scale_y))return false;
		}
		if!(is_undefined(draw))draw(self);
		var al = array_length(children);
		for(i=0;i<al;i+=1){
			children[i].Draw();
		}
		if(global.ui_showbox == true) draw_rectangle_color(abs_x, abs_y, abs_x + abs_width * scale_x, abs_y + abs_height * scale_y, c_yellow, c_yellow, c_yellow, c_yellow, 1);
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
		for(i=0;i<al;i+=1){
			if(children[i] == child){
				array_delete(children,i,1);
				break;
			}
		}
	}
	
	static AddContent = function(content){
		if(is_array(content)){
			var al = array_length(content);
			for(i=0;i<al;i+=1){
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
		array_push(events[$ type],method(self,func));
	}
	
	static RemoveEvent = function(type,func){
		if(variable_struct_exists(events,type)){
			var al = array_length(events[$ type]);
			for(i=0;i<al;i+=1){
				if(events[$ type][i] == func){
					array_delete(events[$ type],i,1);
					break;
				}
			}
		}
	}
	
	static CallEvent = function(type,arg0=0,arg1=0){
		var al = array_length(events[$ type]);
		for(i=0;i<al;i+=1){
			events[$ type][i](self,arg0,arg1);
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
