live;
if(time >= 1&&time <= 1+4){
	if((time-1) mod 4 = 0){
		switch((time-1) div 4){
			case 0:
				xx = x - 50;
				yy = y + 40;
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
				    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
				    sb.mark = mark;
				}
				break;
			case 1:
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
					Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
					Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
					Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
				    sb.mark = mark;
				}
				break;
		}
	}
}
if(time >= 30&&time <= 30+4){
	if((time-30) mod 4 = 0){
		switch((time-30) div 4){
			case 0:
				xx = x + 50;
				yy = y + 40;
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
				    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
				    sb.mark = mark;
				}
				break;
			case 1:
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
					Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
					Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
					Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
				    sb.mark = mark;
				}
				break;
		}
	}
}
if(time >= 60&&time <= 60+4){
	if((time-60) mod 4 = 0){
		switch((time-60) div 4){
			case 0:
				xx = x - 50;
				yy = y + 40;
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
				    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
				    sb.mark = mark;
				}
				break;
			case 1:
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
					Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
					Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
					Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
				    sb.mark = mark;
				}
				break;
		}
	}
}
if(time >= 90&&time <= 90+4){
	if((time-90) mod 4 = 0){
		switch((time-90) div 4){
			case 0:
				xx = x + 50;
				yy = y + 40;
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
				    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
				    sb.mark = mark;
				}
				break;
			case 1:
				for(i=0;i<4;i+=1){
					sb = instance_create_depth(xx,yy,0,bullet_enemy_red);
					sb.sprite_index = spr_bullet_enemy_red_2;
					sb.image_angle = 45 + i*90;
					sb.mark = mark;
					sb.direction = -90;
					Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
					Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
					Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
				    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
				    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
				    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
				    sb.mark = mark;
				}
				break;
		}
	}
}

if(time >= 200&&time <= 200+10*3){
	if((time-200) mod 10 = 0){
		for(i=0;i<4;i+=1){
			blt = instance_create_depth(x,y,0,bullet_enemy_red);
			blt.sprite_index = spr_bullet_enemy_red_0;
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			blt.mark = mark;
			blt.direction = -90 + i*10;
			blt.speed = 8 - (i mod 2)*2;
		}
		for(i=1;i<4;i+=1){
			blt = instance_create_depth(x,y,0,bullet_enemy_red);
			blt.sprite_index = spr_bullet_enemy_red_0;
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			blt.mark = mark;
			blt.direction = -90 - i*10;
			blt.speed = 8 - (i mod 2)*2;
		}
	}
}
if(time >= 300&&time <= 300+3*20){
	if((time-300) mod 3 = 0){
		for(i=0;i<3;i+=1){
			dd = 120*i - 90 + ((time-300) div 3)*6;
			blt = instance_create_depth(x,y,0,bullet_enemy_red);
			blt.sprite_index = spr_bullet_enemy_red_1;
			blt.image_angle = dd;
			blt.direction = dd;
			Anim_Create(blt,"speed",0,0,-5,14,60-(((time-300) div 3) mod 3)*10);
		}
	}
}
if(time >= 450&&time <= 450+3*10){
	if((time-450) mod 3 = 0){
		for(i=0;i<3;i+=1){
			dd = -90 + ((time-450) div 3)*5+2;
			blt = instance_create_depth(x,y,0,bullet_enemy_red);
			blt.sprite_index = spr_bullet_enemy_red_0;
			blt.image_angle = dd;
			blt.direction = dd;
			blt.speed = 3 + i;
		}
		for(i=0;i<3;i+=1){
			dd = -90 - ((time-450) div 3)*5-2;
			blt = instance_create_depth(x,y,0,bullet_enemy_red);
			blt.sprite_index = spr_bullet_enemy_red_0;
			blt.image_angle = dd;
			blt.direction = dd;
			blt.speed = 3 + i;
		}
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