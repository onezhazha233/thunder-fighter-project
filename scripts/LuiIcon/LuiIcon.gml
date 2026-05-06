///@desc This item displays the icon.
/// Available parameters:
/// value
/// quality
/// alpha
/// maintain_aspect
///@arg {Struct} [_params] Struct with parameters
function LuiIcon(_params = {}) : LuiBase(_params) constructor {
	
	self.value = _params[$ "value"] ?? undefined;
	self.quality = _params[$ "quality"] ?? -1;
	self.alpha = _params[$ "alpha"] ?? 1;
	self.maintain_aspect = _params[$ "maintain_aspect"] ?? true;
	
	self.sprite_real_width = 0;
	self.sprite_real_height = 0;
	self.aspect = 1;
	
	self.iconspr = asset_get_index("spr_icon_"+self.value);
	
	///@desc Set sprite
	///@arg {asset.GMSprite} _sprite
	static setSprite = function(_sprite) {
		self.set(_sprite);
		return self;
	}
	
	///@desc Set subimg of sprite
	///@arg {real} _subimg
	static setSubimg = function(_subimg) {
		self.subimg = _subimg;
		return self;
	}
	
	///@desc Set blend color for sprite
	///@arg {any} _color_blend
	static setColor = function(color_blend) {
		self.color_blend = color_blend;
		return self;
	}
	
	///@desc Set alpha for sprite
	///@arg {real} _alpha
	static setAlpha = function(_alpha) {
		self.alpha = _alpha;
		return self;
	}
	
	///@desc Set maintain aspect of sprite
	///@arg {bool} _maintain_aspect
	static setMaintainAspect = function(_maintain_aspect) {
		self.maintain_aspect = _maintain_aspect;
		return self;
	}
	
	///@ignore
	static _calcSpriteSize = function(){
		if !is_undefined(iconspr) && sprite_exists(iconspr) {
			self.sprite_real_width = sprite_get_width(iconspr);
			self.sprite_real_height = sprite_get_height(iconspr);
			self.aspect = self.sprite_real_width / self.sprite_real_height;
		}
	}
	
	self.draw = function(){
		//Calculate fit size
		var _width = self.width;
		var _height = self.height;
		if self.maintain_aspect {
			if _width / self.aspect <= self.height  {
				_height = _width / self.aspect;
			} else {
				_width = _height * self.aspect;
			}
		}
		//Draw sprite
		if !is_undefined(iconspr) && sprite_exists(iconspr) {
			draw_icon(self.x,self.y,self.value,self.quality,_width,self.alpha);
		}
		else{
			draw_icon(self.x,self.y,"unknown",self.quality,_width,self.alpha);
		}
	}
	
	self.step = function(){
		updateMainUiSurface();
	}
	
	self.addEvent(LUI_EV_CREATE, function(_element) {
		_element._calcSpriteSize();
	});
	
	self.addEvent(LUI_EV_VALUE_UPDATE, function(_element) {
		_element._calcSpriteSize();
	});
}