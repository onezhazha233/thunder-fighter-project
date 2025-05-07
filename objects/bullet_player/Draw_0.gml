live;
draw_set_color(c_red)
switch(collision_type){
	case 0:
		draw_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,1);
		break;
	
	case 1:
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
		break;
}
draw_set_color(-1)