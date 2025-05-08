live;
event_inherited();

if(hp <= 0){
	layer_sequence_create("enemies",x,y,seq_enemy_boss_mini_2_die);
}

time += 1
if(time = 40){
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
}
if(time = 80){
	SetState(1);
}
if(time >= 160&&time <= 160+6*7){
	if((time-160) mod 6 = 0){
		switch((time-160) div 6){
			case 0:
			case 6:
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				break;
			case 1:
			case 5:
				a = instance_create_depth(x-20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a = instance_create_depth(x+20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				break;
			case 2:
			case 4:
				a = instance_create_depth(x-40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a = instance_create_depth(x+40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				break;
			case 3:
				a = instance_create_depth(x-60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a = instance_create_depth(x+60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				break;
		}
	}
}
if(time = 210){
	for(i=0;i<5;i+=1){
		for(j=0;j<15;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/5*i-90;
			a.image_angle = cd+j*3.5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,-3-(5-j/3),3*3+(5-j/3)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/5*i-90;
				a.image_angle = cd-j*3.5;
				a.direction = a.image_angle;
				Anim_Create(a,"speed",0,0,-3-(5-j/3),3*3+(5-j/3)*2,40);
			}
		}
	}
}
if(time = 240){
	for(i=0;i<6;i+=1){
		for(j=0;j<10;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/6*i-45;
			a.image_angle = cd+j*4;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,-2-(5-j/2),2*3+(5-j/2)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/6*i-45;
				a.image_angle = cd-j*4;
				a.direction = a.image_angle;
				Anim_Create(a,"speed",0,0,-2-(5-j/2),2*3+(5-j/2)*2,40);
			}
		}
	}
}
if(time = 270){
	for(i=0;i<7;i+=1){
		for(j=0;j<10;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/7*i+45;
			a.image_angle = cd+j*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,-1-(5-j/2),1*3+(5-j/2)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/7*i+45;
				a.image_angle = cd-j*5;
				a.direction = a.image_angle;
				Anim_Create(a,"speed",0,0,-1-(5-j/2),1*3+(5-j/2)*2,40);
			}
		}
	}
}
if(time >= 300&&time <= 300+5*10){
	if((time-300) mod 5 = 0){
		a = instance_create_depth(x+20,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x+10,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle+180;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x-20,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x-10,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle+180;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
	}
}
/*if(time = 160){
	dir = random(360);
	n0 = 5;
	n1 = 20;
	for(i=0;i<n0;i+=1){
		for(j=0;j<20;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_0;
			a.direction = 360/n0*i;
			a.image_angle = a.direction;
			Anim_Create(a,"speed",0,0,15,-15,30);
			Anim_Create(a,"direction",0,0,0,a.direction-180+j*360/n1,0,30);
			Anim_Create(a,"image_angle",0,0,0,a.image_angle-180+j*360/n1,0,30);
			Anim_Create(a,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
	}
}
if(time = 300){
	dir = random(360);
	n0 = 6;
	n1 = 30;
	for(i=0;i<n0;i+=1){
		for(j=0;j<20;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			a.direction = 360/n0*i;
			a.image_angle = a.direction - 90;
			Anim_Create(a,"speed",0,0,15,-15,30);
			Anim_Create(a,"direction",0,0,0,a.direction-180+j*360/n1,0,30);
			Anim_Create(a,"image_angle",0,0,0,a.image_angle-180+j*360/n1-90,0,30);
			Anim_Create(a,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
	}
}
if(time = 440){
	dir = random(360);
	n0 = 8;
	n1 = 40;
	for(i=0;i<n0;i+=1){
		for(j=0;j<20;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_2;
			a.direction = 360/n0*i;
			a.image_angle = a.direction;
			Anim_Create(a,"speed",0,0,15,-15,30);
			Anim_Create(a,"direction",0,0,0,a.direction-180+j*360/n1,0,30);
			Anim_Create(a,"image_angle",0,0,0,a.image_angle-180+j*360/n1,0,30);
			Anim_Create(a,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
	}
}
if(time > 600){
	if(time mod 2 = 0){
	    aa += sin(time/100);
	    for(i=0;i<num;i+=1){
	        b = instance_create_depth(x,y,0,bullet_enemy_red);
			b.sprite_index = spr_bullet_enemy_red_1;
	        b.direction = i*(360/num)+aa*20;
	        b.speed = as;
	        b.image_angle =  b.direction;
	    }
		as += 0.005;
	}
}
if(time = 900){
	num = 5;
}
if(time = 1200){
	num = 6;
}