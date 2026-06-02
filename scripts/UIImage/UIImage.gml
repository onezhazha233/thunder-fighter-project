function UIImage(spr,img,xx,yy): UIBase(xx, yy) constructor{
	sprite = spr;
	image = img;
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	color = -1;
	
	nineslice = false;
	nineslice_mode = 0;
	
	black = 0;
	
	draw = function(){
		if(black > 0)draw_sprite_ext(spr_pixel2x,0,room_width/2,room_height/2,room_width/2,room_height/2,0,0,black);
		if(nineslice == true){
			draw_sprite_nineslice(sprite,image,abs_x,abs_y,width,height,abs_scale_x,abs_scale_y,nineslice_mode,color,abs_alpha);
		}
		else{
			draw_sprite_ext(sprite,image,abs_x,abs_y,abs_scale_x,abs_scale_y,0,color,abs_alpha);
		}
	}
}
