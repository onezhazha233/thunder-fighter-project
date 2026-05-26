function draw_laser(spr,img,xx,yy,offset,dir,length,flip,xscale,yscale,alpha,single=false,mirror=false,blend=-1){
	var w = sprite_get_width(spr) * xscale;
	var h = sprite_get_height(spr) * yscale;
	var w_px = max(1, ceil(abs(w)));
	var h_px = max(1, ceil(abs(h)));
	if(w_px > 0){
	    if (!variable_global_exists("draw_laser_surf")) {
	        global.draw_laser_surf = -1;
	        global.draw_laser_surf_w = 0;
	    }
	    var _target_w = global.draw_laser_surf_w;
	    if (_target_w < w_px) {
	        _target_w = 256;
	        while (_target_w < w_px) _target_w *= 2;
	    }
	    if (!surface_exists(global.draw_laser_surf) || global.draw_laser_surf_w < _target_w) {
	        if (surface_exists(global.draw_laser_surf)) surface_free(global.draw_laser_surf);
	        global.draw_laser_surf = surface_create(_target_w, 1500);
	        global.draw_laser_surf_w = _target_w;
	    }
	    var _texfilter = gpu_get_texfilter();
	    gpu_set_texfilter(false);
		surface_set_target(global.draw_laser_surf);
		draw_clear_alpha(0,0);
		var count = (single = true ? 1 : (1500 div h_px + 1));
		for(var i=(flip=true ? -2 : -1);i<count;i+=1){
			if(i mod 2 = 0&&flip = true){
				draw_sprite_ext(spr,img,w/2,h*(i+1)+offset,xscale*(mirror=false ? 1 : -1),-yscale,180,-1,1);
			}
			else{
				draw_sprite_ext(spr,img,w/2,h*i+offset,xscale*(mirror=false ? 1 : -1),yscale,180,-1,1);
			}
		}
		surface_reset_target();
	
		draw_surface_general(global.draw_laser_surf,0,0,w,length,xx+lengthdir_x(w/2,dir-90),yy+lengthdir_y(w/2,dir-90),1,1,dir+90,blend,blend,blend,blend,alpha);
		gpu_set_texfilter(_texfilter);
	}
}
