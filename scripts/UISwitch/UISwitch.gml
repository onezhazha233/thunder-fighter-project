function UISwitch(spr,xx,yy): UIBase(xx,yy) constructor{
	sprite = spr;
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	
	value = false;
	
	AddEvent(UI_EVENT.CLICK,function(el){
		el.value = !el.value;
		SFX_Play(snd_touch);
	});
	
	draw = function(){
		draw_sprite_ext(sprite,value,abs_x,abs_y,abs_scale_x,abs_scale_y,0,-1,abs_alpha);
	}
}
