event_inherited();

xscale = 1
yscale = 1
plane = plane_blaze_phoenix
wingman_left = [wingman_hyper_speed_gatling]
wingman_right = [wingman_hyper_speed_gatling]
subweapon = subweapon_lightning_nova

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}