function laser_find_width(ox, oy, dir, range, width, object, prec, notme){
	for(i=0;i<width/2;i+=1){
	    ldir = dir + 90;
		lx = ox + lengthdir_x(i,ldir);
		ly = oy + lengthdir_y(i,ldir);
		find = laser_find(lx,ly,dir,range,object,prec,notme);
		if(instance_exists(find[1])){
			return find;
		}
		
	    rdir = dir - 90;
		rx = ox + lengthdir_x(i,rdir);
		ry = oy + lengthdir_y(i,rdir);
		find = laser_find(rx,ry,dir,range,object,prec,notme);
		if(instance_exists(find[1])){
			return find;
		}
	}
	return [-1,noone];
}