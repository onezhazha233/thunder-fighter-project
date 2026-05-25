live;
if(wave_effect = true){
	wave_image += 0.3;
	wave_image = wave_image mod 4;
	wave_offset += 11.6;
	if(wave_offset > 188-40)wave_offset -= 188;
	var w = sprite_get_width(spr_bullet_enemy_laser_blue_wave)*3;
	var h = sprite_get_height(spr_bullet_enemy_laser_blue_wave);
	var w_px = max(1, ceil(abs(w)));
	var h_px = max(1, ceil(abs(h)));
	if(w_px > 0){
	    if (!variable_global_exists("draw_laser_surf")) {
	        global.draw_laser_surf = -1;
	        global.draw_laser_surf_w = 0;
	    }
	    if (!surface_exists(global.draw_laser_surf) || global.draw_laser_surf_w < w_px) {
	        if (surface_exists(global.draw_laser_surf)) surface_free(global.draw_laser_surf);
	        global.draw_laser_surf = surface_create(w_px, 1500);
	        global.draw_laser_surf_w = w_px;
	    }
		surface_set_target(global.draw_laser_surf);
		draw_clear_alpha(0,0);
		var count = (1500 div h_px + 1);
		for(var i=-1;i<count;i+=1){
			al = 1;
			xs = 1;
			ys = 1;
			wys = 1;
			wo = 0;
			if(i = 1){
				wys = 0.5;
				wo = 30;
			}
			if(i = 0){
				if(wave_offset > 20){
					al = min(1,(wave_offset)/188*3);
					xs = min(1,(wave_offset)/188*2.5);
					ys = min(1,(wave_offset)/188*2.5);
				}
				else{
					al = 0;
					xs = 0;
					ys = 0
				}
			}
			if(i>0)draw_sprite_ext(spr_bullet_enemy_laser_blue_lightning,4-wave_image,w/2+30*wave_xscale,h*i-60,-wave_xscale,1,180,-1,1);
			draw_sprite_ext(spr_bullet_enemy_laser_blue_lightning,4-wave_image,w/2-30*wave_xscale,h*i-150+wo,wave_xscale,wys,180,-1,1);
			draw_sprite_ext(spr_bullet_enemy_laser_blue_wave,0,w/2,h*i+wave_offset,wave_xscale*xs,ys,180,-1,al);
		}
		surface_reset_target();
	
		draw_surface_general(global.draw_laser_surf,0,0,w,length,x+lengthdir_x(w/2,image_angle-90),y+lengthdir_y(w/2,image_angle-90),1,1,image_angle+90,-1,-1,-1,-1,image_alpha);
	}
}