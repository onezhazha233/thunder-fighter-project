live;
event_inherited();

if(time < 200){
	if(time mod 5 = 1){
		xx = x;
		yy = y;
		dir = random_range(-60,-120);
		for(i=0;i<6;i+=1){
			s[i] = instance_create_depth(xx+lengthdir_x(30,60*i+90),yy+lengthdir_y(30,60*i+90),0,bullet_enemy_red);
			s[i].sprite_index = spr_bullet_enemy_red_1;
			s[i].image_angle = 60*i+90;
			s[i].direction = dir;
			s[i].mark = mark;
			Anim_Create(s[i],"speed",0,0,15,-15,200);
		}
	}
}
if(time = 200){
	with(bullet_enemy_red){
		Anim_Destroy(id,"speed");
		Anim_Create(id,"speed",0,0,speed,-speed-6,40);
		Anim_Create(id,"direction",0,0,direction,image_angle-direction,0,70);
		Anim_Create(id,"speed",0,0,6,-5,60,70);
		Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale,50,100);
		Anim_Create(id,"image_yscale",0,0,image_yscale,-image_yscale,50,100);
	}
}