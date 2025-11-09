live;
SetPosition(x,y)

if(burn_amount >= burn_target){
	burn_amount = 0;
	SetBurn(burn_time);
}
if(burn_duration > 0){
	burn_amount = 0;
	burn_duration -= 1;
	effect_type = 1;
	effect_alpha += (0.7-effect_alpha)/2;
	if(inv_damage = false)hp -= burn_damage;
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
	SetBurn(0);
}

if(frozen_amount >= frozen_target){
	frozen_amount = 0;
	SetFrozen(frozen_time);
}
if(frozen_duration > 0){
	frozen_amount = 0;
	frozen_duration -= 1;
}
if(frozen_duration = 0){
	frozen_duration = -1;
	SetFrozen(0);
}