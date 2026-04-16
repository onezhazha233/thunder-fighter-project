live;
if(mouse_check_button_pressed(mb_left)){
	dir = point_direction(x,y,mouse_x,mouse_y);
	aa = 1;
}

if(aa = 1){
	time += 1;
	if(time mod 3 = 1){
		bn = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_blueneedle,1);
		bn.direction = dir;
		bn.image_angle = bn.direction;
		bn.image_xscale = 0.25;
		Anim_Create(bn,"speed",0,0,25,-8,15);
		Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,2.7-bn.image_xscale,15);
	}
	if(time = 13){
		aa = 0;
		time = 0;
	}
}