live;
event_inherited();

battle_ui.boss_hpbar_hp_max = hp_max
battle_ui.boss_hpbar_hp = hp

time += 1
if(time = 40){
	Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,x_target-x,40);
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,y_target-y,40);
}
if(time = 80){
	SetState(1);
}
if(time > 160){
	x += sin(time/20)*1.5;
	y += cos(time/20)*1.5;
}