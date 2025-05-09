live;
draw_circle_color(x,y,40,color,color,0)

if(mouse_check_button_pressed(mb_left)){
	if(point_distance(mouse_x,mouse_y,x,y) <= 40)instance_destroy();
}