live;
if(layer_sequence_exists(global.layer_bullets_enemy,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,scale_x);
	layer_sequence_yscale(bullet_sequence,scale_y);
	layer_sequence_angle(bullet_sequence,image_angle);
}

if(collision_mask_enabled = false&&global.debug_bullet_enemy_collision_display = true){
	draw_set_color(c_red);
	switch(collision_mask_type){
		case 0:
			draw_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,1);
			break;
		case 1:
			draw_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,1);
			break;
	}
	draw_set_color(-1);
}