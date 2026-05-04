function draw_icon(xx,yy,name,quality=-1,scale=1,alpha=1){
	if(quality = -1){
		quality = 0;
		if(string_ends_with(name,"_a"))quality = 0;
		if(string_ends_with(name,"_b"))quality = 1;
		if(string_ends_with(name,"_c")||string_ends_with(name,"_c0")||string_ends_with(name,"_c123"))quality = 2;
		if(string_ends_with(name,"_d"))quality = 3;
	}
	var spr = asset_get_index("spr_icon_"+name);
	if(spr = -1)spr = spr_icon_unknown;
	draw_sprite_ext(spr,0,xx,yy,scale,scale,0,-1,alpha);
	draw_sprite_ext(spr_icon_frame_1,quality,xx,yy,scale,scale,0,-1,alpha);
	if(quality = 3){
		var time = (current_time / 1000) * 60 mod 86;
		draw_frame_d_glow(time,xx,yy,scale,alpha);
	}
}