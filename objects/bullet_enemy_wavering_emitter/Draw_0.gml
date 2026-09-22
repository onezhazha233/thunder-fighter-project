live;
event_inherited();

image_xscale = scale
image_yscale = scale

_total = 30

if(time <= _total){
	draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,c_white,image_alpha);
	draw_sprite_ext(sprite_index,1,x,y,scale,scale,0,c_white,image_alpha);

	_alpha2 = (time < 15 ? time/15 : (30-time)/15);
	_alpha2 = clamp(_alpha2,0,1);
	draw_sprite_ext(sprite_index,2,x,y,scale,scale,0,c_white,_alpha2*image_alpha);

	if(time < 10){
		_alpha1 = 0.5+time/10*0.5;
	}else if(time < 20){
		_alpha1 = 1.0;
	}else{
		_alpha1 = (30-time)/10;
	}
	_alpha1 = clamp(_alpha1,0,1);
	_scale = 0.4+time/30*0.6;
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,3,x,y,_scale*scale,_scale*scale,0,c_white,_alpha1*image_alpha);
	gpu_set_blendmode(bm_normal);
}

time += 1
if(time > 30)time = 0