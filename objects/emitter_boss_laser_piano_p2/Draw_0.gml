live;
for(i=0;i<26;i+=1){
	draw_circle_color(laser_pos_x[i],laser_pos_y[i],3,c_yellow,c_lime,0);
	draw_text(laser_pos_x[i]-5,laser_pos_y[i]-30,i);
}