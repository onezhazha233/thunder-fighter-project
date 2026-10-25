live;
draw_primitive_begin(pr_trianglestrip)
for(i=0;i<3;i+=1){
	draw_vertex_color(x+lengthdir_x(50,i*120-90),y+lengthdir_y(50,i*120-90),c_red,0.5);
}
draw_primitive_end()
draw_circle_color(x,y,5,c_aqua,c_purple,0)