function draw_laser(spr,img,xx,yy,offset,dir,length,flip,xscale,yscale,alpha,single=false,mirror=false,blend=-1){
	var w = sprite_get_width(spr)*xscale;
	if(w > 0){
		var h = sprite_get_height(spr)*yscale;
	    var surf = surface_create(w,1500);
		surface_set_target(surf);
		draw_clear_alpha(0,0);
		var count = (single = true ? 0 : (1500 div h + 1));
		if(h = 1)count = 1;
		for(var i=(flip=true ? -2 : -1);i<count;i+=1){
			if(i mod 2 = 0&&flip = true){
				draw_sprite_ext(spr,img,w/2,h*(i+1)+offset,xscale*(mirror=false ? 1 : -1),-(h = 1 ? 1500 : yscale),180,-1,1);
			}
			else{
				draw_sprite_ext(spr,img,w/2,h*i+offset,xscale*(mirror=false ? 1 : -1),(h = 1 ? 1500 : yscale),180,-1,1);
			}
		}
		surface_reset_target();
	
		draw_surface_general(surf,0,0,w,length,xx+lengthdir_x(w/2,dir-90),yy+lengthdir_y(w/2,dir-90),1,1,dir+90,blend,blend,blend,blend,alpha);
	
		surface_free(surf);
	}
}