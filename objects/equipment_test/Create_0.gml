event_inherited();

xscale = 1
yscale = 1
plane = plane_assault_zero
wingman_left = [wingman_double_shotcannon]
wingman_right = [wingman_double_shotcannon]
subweapon = subweapon_missile_a

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}