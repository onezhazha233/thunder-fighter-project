live;
event_inherited();

battle_ui.boss_hpbar_hp_max = hp_max
battle_ui.boss_hpbar_hp = hp

if(start = 1){
	if(time mod 50 = 1){
		Anim_Create(id,"x",0,0,x,random_range(360-200,360+200)-x,40);
		Anim_Create(id,"y",0,0,y,random_range(150,360)-y,40);
	}
}