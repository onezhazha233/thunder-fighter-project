live;
if(collision_mask_enabled = false){
	draw_set_color(c_red);
	switch(collision_mask_type){
		case 0:
			//draw_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,1);
			break;
		case 1:
			//draw_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,1);
			break;
	}
	draw_set_color(-1);
}