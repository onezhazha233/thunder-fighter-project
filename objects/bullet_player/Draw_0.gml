live;
if(layer_sequence_exists("bullets_player",bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,scale_x);
	layer_sequence_yscale(bullet_sequence,scale_y);
	layer_sequence_angle(bullet_sequence,image_angle);
}

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