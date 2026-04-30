live;
draw_sprite_ext(spr_ui_loading_bg,0,0,down_y+60,1,1,0,-1,1)
draw_sprite_ext(spr_ui_loading_bg,1,0,up_y+60,1,1,0,-1,1)
draw_sprite_ext(spr_ui_loading_light,1,360,480+60,0.45,1,0,-1,light_alpha)
draw_sprite_ext(spr_ui_loading_light,1,360,520+60,0.45,-1,0,-1,light_alpha)
draw_sprite_ext(spr_ui_loading_screen,2,360,490+60,1,1,0,-1,center_alpha)
draw_sprite_ext(spr_ui_loading_text,0,360,490+60,0.6,0.6,0,-1,text_alpha_0)
draw_sprite_ext(spr_ui_loading_text,1,360,490+60,0.6,0.6,0,-1,text_alpha_1)
draw_sprite_ext(spr_ui_loading_screen_border,1,0,down_y+642+60,1,-1,0,-1,1)
draw_sprite_ext(spr_ui_loading_screen_border,1,720,down_y+642+60,-1,-1,0,-1,1)
draw_sprite_ext(spr_ui_loading_screen_border,1,0,up_y+338+60,1,1,0,-1,1)
draw_sprite_ext(spr_ui_loading_screen_border,1,720,up_y+338+60,-1,1,0,-1,1)

/*draw_text(0,20,time)
draw_text(0,50,state)
draw_text(0,80,room_get_name(room))*/