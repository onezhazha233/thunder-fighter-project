live;
time += 1
if(time = 1){
	cn = instance_create_depth(360,300,0,bullet_enemy_laser_piano_node_0);
	dist = 0;
	ang = 0;
	rot = 0;
}
if(time = 90){
	for(i=0;i<4;i+=1){
		sn[i] = instance_create_depth(360,300,0,bullet_enemy_laser_piano_node_0);
		sn[i].state = 2;
	}
	Anim_Create(id,"dist",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,300,30);
}
if(time = 170){
	for(i=0;i<4;i+=1){
		sl[i] = instance_create_depth(0,0,0,bullet_enemy_laser_piano_node_laser);
		sl[i].node_0 = cn;
		sl[i].node_1 = sn[i];
	}
	Anim_Create(id,"rot",0,0,0,3,40);
	Anim_Create(cn,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,cn.y,-100,30,20);
	Anim_Create(cn,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN,cn.y-100,1500,90,50);
}
if(time >= 90){
	for(i=0;i<4;i+=1){
		sn[i].x = cn.x + lengthdir_x(dist,ang+i*90);
		sn[i].y = cn.y + lengthdir_y(dist,ang+i*90);
	}
}
ang += rot;