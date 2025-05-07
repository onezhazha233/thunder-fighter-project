plane_inst = instance_create_depth(x,y,depth,plane)
plane_inst.image_xscale = xscale
plane_inst.image_yscale = yscale
plane_inst.image_angle = angle
for(i=0;i<array_length(wingman_left);i+=1){
	xx = x + lengthdir_x(-wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90);
	yy = y + lengthdir_y(-wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90);
	wingman_left_inst[i] = instance_create_depth(xx,yy,depth,wingman_left[i]);
	wingman_left_inst[i].image_xscale = xscale;
	wingman_left_inst[i].image_yscale = yscale;
	wingman_left_inst[i].image_angle = angle;
	wingman_left_inst[i].flip = 1;
}
for(i=0;i<array_length(wingman_right);i+=1){
	xx = x + lengthdir_x(wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90);
	yy = y + lengthdir_y(wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90);
	wingman_right_inst[i] = instance_create_depth(xx,yy,depth,wingman_right[i]);
	wingman_right_inst[i].image_xscale = xscale;
	wingman_right_inst[i].image_yscale = yscale;
	wingman_right_inst[i].image_angle = angle;
}
if(player_point_enabled = true){
	player_point = layer_sequence_create("instances_upper",x,y,seq_player_point);
}