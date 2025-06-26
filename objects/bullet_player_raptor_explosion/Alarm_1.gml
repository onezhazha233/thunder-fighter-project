live;
el = ds_list_create();
ce = collision_circle_list(x,y,25*image_xscale,enemy_agent,1,1,el,0);
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
ds_list_destroy(el);