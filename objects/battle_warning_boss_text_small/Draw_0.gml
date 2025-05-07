live;
for(i=0;i<8;i+=1){
	draw_sprite_ext(spr_ui_warning_boss_text_small,0,x+txu[i]*image_xscale,y-83-yo,image_xscale,image_yscale,0,-1,image_alpha);
	draw_sprite_ext(spr_ui_warning_boss_text_small,0,x+txd[i]*image_xscale,y+83+yo,image_xscale,image_yscale,0,-1,image_alpha);
}