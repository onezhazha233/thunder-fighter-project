live;
event_inherited();

if(hp <= 0){
	layer_sequence_create("enemies",x,y,seq_enemy_boss_mini_1_die);
}

time += 1
if(time = 40){
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
}
if(time = 80){
	SetState(1);
}