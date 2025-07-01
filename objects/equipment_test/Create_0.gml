event_inherited();

xscale = 1
yscale = 1
plane = plane_ghost_xeno
wingman_left = [wingman_ultra_plasma_cannon]
wingman_right = [wingman_ultra_plasma_cannon]
subweapon = subweapon_ultra_cluster_bomb

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}