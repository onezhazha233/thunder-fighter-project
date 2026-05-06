if(instance_exists(plane_inst))instance_destroy(plane_inst);
plane_inst = instance_create_depth(x,y,depth,plane)
plane_inst.image_xscale = xscale
plane_inst.image_yscale = yscale
plane_inst.image_angle = angle
for(i=0;i<array_length(wingman_left);i+=1){
	if(instance_exists(wingman_left_inst[i]))instance_destroy(wingman_left_inst[i]);
	xx = x + lengthdir_x(-wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90);
	yy = y + lengthdir_y(-wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90);
	wingman_left_inst[i] = instance_create_depth(xx,yy,depth-10,wingman_left[i]);
	wingman_left_inst[i].image_xscale = xscale;
	wingman_left_inst[i].image_yscale = yscale;
	wingman_left_inst[i].image_angle = angle;
	wingman_left_inst[i].flip = 1;
}
for(i=0;i<array_length(wingman_right);i+=1){
	if(instance_exists(wingman_right_inst[i]))instance_destroy(wingman_right_inst[i]);
	xx = x + lengthdir_x(wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90);
	yy = y + lengthdir_y(wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90);
	wingman_right_inst[i] = instance_create_depth(xx,yy,depth-10,wingman_right[i]);
	wingman_right_inst[i].image_xscale = xscale;
	wingman_right_inst[i].image_yscale = yscale;
	wingman_right_inst[i].image_angle = angle;
}
if(player_point_enabled = true){
	if!(layer_exists(global.layer_instances_upper))global.layer_instances_upper = layer_create(DEPTH_BATTLE.INSTANCES_UPPER);
	player_point = layer_sequence_create(global.layer_instances_upper,x,y,seq_player_point);
}
else{
	if(layer_exists(global.layer_instances_upper)){
		if(layer_sequence_exists(global.layer_instances_upper,player_point)){
			layer_sequence_destroy(player_point);
		}
	}
}
if!(subweapon = -1){
	if(instance_exists(subweapon_inst))instance_destroy(subweapon_inst);
	subweapon_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,subweapon);
	subweapon_inst.scale_x = xscale;
	subweapon_inst.scale_y = yscale;
}
if!(armor = -1){
	if(instance_exists(armor_inst))instance_destroy(armor_inst);
	armor_inst = instance_create_depth(0,0,0,armor);
}
SetEnabled(enabled)