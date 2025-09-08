live;
SetPosition(x,y)

if(burn_amount >= burn_target){
	burn_duration = burn_time;
	burn_amount = 0;
}
if(burn_duration > 0){
	burn_duration -= 1;
	effect_type = 1;
	effect_alpha += (0.7-effect_alpha)/2;
	if(inv_damage = false)hp -= burn_damage;
}
if(burn_duration = 0){
	burn_duration = -1;
	Anim_Create(id,"effect_alpha",0,0,effect_alpha,-effect_alpha,10);
	Anim_Create(id,"effect_type",0,0,effect_type,-effect_type,0,10);
}