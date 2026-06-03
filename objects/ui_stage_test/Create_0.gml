live;
main_ui = new UIBase(0,0,room_width,room_height)

panel = new UIBase(30,30,500,1800)
panel.draw = function(el){
	for(i=0;i<100;i+=1){
		draw_sprite_ext(spr_pixel2x,0,el.abs_x+el.abs_width/2,el.abs_y+(9+18*i)*el.abs_scale_y,200+sin(i/10)*50,9,0,make_colour_hsv(i,255,255),el.abs_alpha);
	}
}
for(i=0;i<10;i+=1){
	btn = new UIButton(spr_ui_button,random_range(100,500),random_range(100,1500));
	panel.AddContent(btn);
}

scroll = new UIScrollPanel(50,50,600,800)
scroll.content_gap = 0

scroll.AddContent(panel)
main_ui.AddContent(scroll)