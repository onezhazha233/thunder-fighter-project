live;
if(burn_amount >= burn_target){
	burn_duration = burn_time;
	burn_amount = 0;
	for(i=0;i<irandom_range(3,5);i+=1){
		xx = random_range(bbox_left,bbox_right);
		yy = random_range(bbox_top,bbox_bottom);
		instance_create_depth(xx,yy,depth-1,effect_enemy_fire);
	}
}
if(burn_duration > 0){
	burn_amount = 0;
	burn_duration -= 1;
	effect_type = 1;
	effect_alpha += (0.7-effect_alpha)/2;
	var dmg = burn_damage;
	var now = time;
	ds_list_add(damage_history, [now, dmg]);
	if(burn_duration mod 5 = 0){
		for(i=0;i<irandom_range(1,3);i+=1){
			xx = random_range(bbox_left,bbox_right);
			yy = random_range(bbox_top,bbox_bottom);
			instance_create_depth(xx,yy,depth-1,effect_enemy_fire);
		}
	}
}
if(burn_duration = 0){
	burn_duration = -1;
	Anim_Create(id,"effect_alpha",0,0,effect_alpha,-effect_alpha,10);
	Anim_Create(id,"effect_type",0,0,effect_type,-effect_type,0,10);
}