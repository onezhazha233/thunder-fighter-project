live;
event_inherited();

OnDie = function(){
	multipler = 1;
	if(Player_GetRampage() > 0){
		instance_create_depth(x,y,0,effect_score_x2);
		multipler += 1;
	}
	Player_AddScore(360*multipler);
	repeat(2){
		a = MakeCrystal(x,y+random_range(bbox_top-y,bbox_bottom-y)*2.5,1);
		spd = random_range(4,10);
		Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,random_range(bbox_left-x,bbox_right-x)*1.5,spd*2);
		a.vspeed = -spd;
	}
}