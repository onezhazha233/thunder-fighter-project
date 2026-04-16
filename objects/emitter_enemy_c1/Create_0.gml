live;
event_inherited();

mode = EMITTER_MODE.FIXED

function attack_0(){
	if(attack_time >= 1&&attack_time <= 1+4){
		if((attack_time-1) mod 4 = 0){
			switch((attack_time-1) div 4){
				case 0:
					xx = x - 50;
					yy = y + 40;
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
					    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
					}
					break;
				case 1:
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
						Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
						Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
						Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
					}
					break;
			}
		}
	}
	if(attack_time >= 30&&attack_time <= 30+4){
		if((attack_time-30) mod 4 = 0){
			switch((attack_time-30) div 4){
				case 0:
					xx = x + 50;
					yy = y + 40;
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
					    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
					}
					break;
				case 1:
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
						Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
						Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
						Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
					}
					break;
			}
		}
	}
	if(attack_time >= 60&&attack_time <= 60+4){
		if((attack_time-60) mod 4 = 0){
			switch((attack_time-60) div 4){
				case 0:
					xx = x - 50;
					yy = y + 40;
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
					    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
					}
					break;
				case 1:
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
						Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
						Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
						Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
					}
					break;
			}
		}
	}
	if(attack_time >= 90&&attack_time <= 90+4){
		if((attack_time-90) mod 4 = 0){
			switch((attack_time-90) div 4){
				case 0:
					xx = x + 50;
					yy = y + 40;
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
					    Anim_Create(sb, "speed", 0,0, 0, 7, 0,24);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,44);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 74);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 20, 74);
					}
					break;
				case 1:
					for(i=0;i<4;i+=1){
						sb = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						sb.image_angle = 45 + i*90;
						sb.direction = -90;
						Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,lengthdir_x(40,45+i*90),20);
						Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,lengthdir_y(40,45+i*90),20);
						Anim_Create(sb, "speed", 0,0, 0, 7, 0,20);
					    Anim_Create(sb, "speed", 0,0, 7, -7, 30,40);
					    Anim_Create(sb, "direction", 0,0, 0, 45 + i * 90, 0, 70);
					    Anim_Create(sb, "speed", 0,0, 0, 8, 16, 70);
					}
					break;
			}
		}
	}
	if(attack_time = 100){
		end_attack();
	}
}
	
function attack_1(){
	if(attack_time >= 1&&attack_time <= 10*3+1){
		if(attack_time mod 10 = 1){
			for(i=0;i<4;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = -90 + i*10;
				blt.speed = 8 - (i mod 2)*2;
			}
			for(i=1;i<4;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = -90 - i*10;
				blt.speed = 8 - (i mod 2)*2;
			}
		}
	}
	if(attack_time = 40){
		end_attack();
	}
}
	
function attack_2(){
	if(attack_time >= 1&&attack_time <= 3*20+1){
		if(attack_time mod 3 = 1){
			for(i=0;i<3;i+=1){
				dd = 120*i - 90 + ((attack_time-1) div 3)*6;
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.image_angle = dd;
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,-5,14,60-(((attack_time-1) div 3) mod 3)*10);
			}
		}
	}
	if(attack_time = 70){
		end_attack();
	}
}
	
function attack_3(){
	if(attack_time >= 1&&attack_time <= 3*10+1){
		if((time-1) mod 3 = 0){
			for(i=0;i<3;i+=1){
				dd = -90 + ((attack_time-1) div 3)*5+2;
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_angle = dd;
				blt.direction = dd;
				blt.speed = 3 + i;
			}
			for(i=0;i<3;i+=1){
				dd = -90 - ((attack_time-1) div 3)*5-2;
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_angle = dd;
				blt.direction = dd;
				blt.speed = 3 + i;
			}
		}
	}
	if(attack_time = 40){
		end_attack();
	}
}
	
var a0 = create_attack(0,attack_0,100);
var a1 = create_attack(1,attack_1,60);
var a2 = create_attack(2,attack_2,80);
var a3 = create_attack(3,attack_3,110);

fixed_sequence = [a0,a1,a2,a3];