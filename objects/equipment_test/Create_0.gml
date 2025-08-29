event_inherited();

xscale = 1
yscale = 1
plane = plane_enigmatic_blade
wingman_left = [wingman_doom_guardian]
wingman_right = [wingman_mega_particle_cannon]
wingman_y_offset = [-50]
//subweapon = subweapon_nano_splitter

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}