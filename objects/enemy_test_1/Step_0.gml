live;
event_inherited();

if(mouse_check_button(mb_right)){
	x = mouse_x;
	y = mouse_y;
}

if(hp <= 0){
	layer_sequence_create(global.layer_enemies_die,x,y,seq_enemy_boss_mini_2_die);
}

time += 1
if(time = 40){
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
}
if(time = 80){
	SetState(1);
}
if(time = 160){
	bullet_emitter_inst.enabled = true;
}