live;
if(rampage = true){
	alarm[0] = -1;
}
else{
	alarm[1] = -1;
}

firetime += 1
if(firetime = 1){
	dir = 170;
	len = 300;
	a = instance_create_depth(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),depth,bullet_player_plane_test);
	a.direction = 40;
	a.speed = 40;
	a.rot = -5;
	a.duration = 7;
}
if(firetime = 10){
	dir = 20;
	len = 400;
	a = instance_create_depth(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),depth,bullet_player_plane_test);
	a.direction = 135;
	a.speed = 40;
	a.rot = 5;
	a.duration = 10;
}
if(firetime = 20){
	dir = 150;
	len = 450;
	a = instance_create_depth(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),depth,bullet_player_plane_test);
	a.direction = 50;
	a.speed = 40;
	a.rot = -4.5;
	a.duration = 12;
}
if(firetime = 30){
	dir = 40;
	len = 550;
	a = instance_create_depth(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),depth,bullet_player_plane_test);
	a.direction = 130;
	a.speed = 40;
	a.rot = 4.5;
	a.duration = 14;
}