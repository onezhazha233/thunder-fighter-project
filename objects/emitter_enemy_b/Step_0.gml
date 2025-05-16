live;
event_inherited();

if(time >= 1&&time <= 1+5*5){
	if((time-1) mod 5 = 0){
		dd = point_direction(x,y,player.x,player.y);
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd;
		a.direction = a.image_angle;
		a.speed = -15;
		Anim_Create(a,"speed",0,0,-15,25,25);
		a.mark = mark;
	}
}
if(time >= 20&&time <= 20+3*7){
	if((time-20) mod 3 = 0){
		dd = point_direction(x,y,player.x,player.y);
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd - 60;
		a.direction = a.image_angle;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,90-((time-1) div 3)*2,40);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,90-((time-1) div 3)*2,40);
		a.speed = 15;
		a.mark = mark;
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd + 60;
		a.direction = a.image_angle;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,-90+((time-1) div 3)*2,40);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,-90+((time-1) div 3)*2,40);
		a.speed = 15;
		a.mark = mark;
	}
}
if(time >= 90&&time <= 90+3*4){
	if((time-90) mod 3 = 0){
		if((time-90) div 3 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<5;i+=1){
			dd = pd + ((time-60) div 3)*5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			a.image_angle = 72*i+dd;
			a.direction = a.image_angle;
			a.speed = 20;
			Anim_Create(a,"speed",0,0,20,-12,3);
			a.mark = mark;
		}
	}
}
if(time >= 120&&time <= 120+3*4){
	if((time-120) mod 3 = 0){
		if((time-120) div 3 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<5;i+=1){
			dd = pd - ((time-60) div 3)*5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			a.image_angle = 72*i+dd;
			a.direction = a.image_angle;
			a.speed = 20;
			Anim_Create(a,"speed",0,0,20,-12,3);
			a.mark = mark;
		}
	}
}
if(time >= 180&&time <= 180+10*3){
	if((time-180) mod 15 = 0){
		if((time-180) div 15 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<4;i+=1){
			dd = pd + ((time-180) div 15)*10+5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_2;
			a.image_angle = dd;
			a.direction = a.image_angle;
			a.speed = 0;
			Anim_Create(a,"speed",0,0,0,15+i*2,100);
			a.mark = mark;
			dd = pd - ((time-180) div 15)*10-5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_2;
			a.image_angle = dd;
			a.direction = a.image_angle;
			a.speed = 0;
			Anim_Create(a,"speed",0,0,0,15+i*2,100);
			a.mark = mark;
		}
	}
}
if(time = 250){
	time = 0;
}
/*if(time >= 1&&time <= 1+6*7){
	if((time-1) mod 6 = 0){
		switch((time-1) div 6){
			case 0:
			case 6:
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 1:
			case 5:
				a = instance_create_depth(x-20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 2:
			case 4:
				a = instance_create_depth(x-40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 3:
				a = instance_create_depth(x-60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				break;
		}
	}
}
if(time = 50){
	for(i=0;i<5;i+=1){
		for(j=0;j<15;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/5*i-90;
			a.image_angle = cd+j*3.5;
			a.direction = a.image_angle;
			a.mark = mark;
			Anim_Create(a,"speed",0,0,-3-(5-j/3),3*3+(5-j/3)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/5*i-90;
				a.image_angle = cd-j*3.5;
				a.direction = a.image_angle;
				a.mark = mark;
				Anim_Create(a,"speed",0,0,-3-(5-j/3),3*3+(5-j/3)*2,40);
			}
		}
	}
}
if(time = 80){
	for(i=0;i<6;i+=1){
		for(j=0;j<10;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/6*i-45;
			a.image_angle = cd+j*4;
			a.direction = a.image_angle;
			a.mark = mark;
			Anim_Create(a,"speed",0,0,-2-(5-j/2),2*3+(5-j/2)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/6*i-45;
				a.image_angle = cd-j*4;
				a.direction = a.image_angle;
				a.mark = mark;
				Anim_Create(a,"speed",0,0,-2-(5-j/2),2*3+(5-j/2)*2,40);
			}
		}
	}
}
if(time = 110){
	for(i=0;i<7;i+=1){
		for(j=0;j<10;j+=1){
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			cd = 360/7*i+45;
			a.image_angle = cd+j*5;
			a.direction = a.image_angle;
			a.mark = mark;
			Anim_Create(a,"speed",0,0,-1-(5-j/2),1*3+(5-j/2)*2,40);
			if(j > 0){
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				cd = 360/7*i+45;
				a.image_angle = cd-j*5;
				a.direction = a.image_angle;
				a.mark = mark;
				Anim_Create(a,"speed",0,0,-1-(5-j/2),1*3+(5-j/2)*2,40);
			}
		}
	}
}
if(time >= 160&&time <= 160+5*10){
	if((time-160) mod 5 = 0){
		a = instance_create_depth(x+20,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle;
		a.mark = mark;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x+10,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle+180;
		a.mark = mark;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x-20,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle;
		a.mark = mark;
		Anim_Create(a,"speed",0,0,0,-8,0,40+dd/10);
		
		a = instance_create_depth(x-10,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_2;
		dd = (time-300) div 5;
		a.image_angle = dd*18;
		a.direction = a.image_angle+180;
		a.mark = mark;
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