live;
event_inherited();

OnDie = function(){
	multipler = 1;
	if(Player_GetRampage() > 0){
		instance_create_depth(x,y,0,effect_score_x2);
		multipler += 1;
	}
	Player_AddScore(360*multipler);
	repeat(8){
		crystal = MakeCrystal(x,y+random_range(bbox_top-y,bbox_bottom-y)*2.5,0);
		spd = random_range(4,10);
		Anim_Create(crystal,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,crystal.x,random_range(bbox_left-x,bbox_right-x)*1.5,spd*2);
		crystal.vspeed = -spd;
	}
}