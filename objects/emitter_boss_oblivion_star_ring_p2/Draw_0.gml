live;
if(top_red_thickness > 0&&current_attack = a3){
	gpu_set_blendmode(bm_add);
	draw_rectangle_color(-10,-10,room_width+10,top_red_thickness,c_red,c_red,0,0,0);
	gpu_set_blendmode(bm_normal);
}
else{
	top_red_thickness = 0;
}