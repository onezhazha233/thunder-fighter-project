live;
event_inherited()

if(instance_exists(node_0)&&node_0.accept_laser = 1){
	node_0_x = node_0.x;
	node_0_y = node_0.y;
}
else{
	enabled = false;
}
if(instance_exists(node_1)&&node_1.accept_laser = 1){
	node_1_x = node_1.x;
	node_1_y = node_1.y;
}
else{
	enabled = false;
}

image_angle = point_direction(node_0_x,node_0_y,node_1_x,node_1_y)
x = (node_0_x + node_1_x)/2;
y = (node_0_y + node_1_y)/2;
image_xscale = point_distance(node_0_x,node_0_y,node_1_x,node_1_y)/2;

draw_self()
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale*(0.9+sin(current_time/1000*100)*0.1),image_angle,-1,image_alpha)