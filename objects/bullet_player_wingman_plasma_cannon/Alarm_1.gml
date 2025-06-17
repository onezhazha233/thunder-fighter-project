live;
el = ds_list_create()
ce = collision_line_list(x,y,x+lengthdir_x(1500,image_angle+90),y+lengthdir_y(1500,image_angle+90),enemy_agent,1,1,el,0)
for(i=0;i<ds_list_size(el);i+=1){
	enemy = el[|i];
	if(instance_exists(enemy)){
		if(enemy.inv_collision = false){
			if(enemy.collision_type = COLLISION_TYPE.SPRITE){
				CollideEnemy(enemy);
			}
		}
	}
}
ds_list_destroy(el)