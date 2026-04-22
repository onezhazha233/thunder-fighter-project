//live;
event_inherited();

mode = EMITTER_MODE.FIXED;

ls = noone

attack_0 = function(){
	live_name = "emitter_enemy_og0c0:attack_0";
	live;
	if(attack_time < 30){
		if(attack_time mod 3 = 0){
			nn = attack_time div 3;
			for(i=0;i<8;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				blt.direction = i*45+nn*20;
				blt.speed = 8;
				Anim_Create(blt,"direction",0,0,blt.direction,90,120);
			}
		}
	}
	else if(attack_time > 40){
		if(attack_time mod 3 = 0){
			nn = attack_time div 3;
			for(i=0;i<8;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				blt.direction = i*45-nn*20;
				blt.speed = 8;
				Anim_Create(blt,"direction",0,0,blt.direction,-90,120);
			}
		}
	}
	if(attack_time = 70){
		end_attack();
	}
}

attack_1 = function(){
	live_name = "emitter_enemy_og0c0:attack_1";
	live;
	if(attack_time = 1){
		ls = MakeEnemyBullet(x,y+80,bullet_enemy_laser_medium);
		ls.delay = 120;
		ls.duration = 30;
	}
	if(instance_exists(ls)){
		ls.x = x;
		ls.y = y+80;
	}
	if(attack_time = 160){
		end_attack();
	}
}

attack_2 = function(){
	live_name = "emitter_enemy_og0c0:attack_2";
	live;
	if(attack_time < 60){
		if(attack_time mod 10 = 0){
			xx = x + sin(attack_time*123654)*100;
			yy = y - 70;
			br = instance_create_depth(xx,yy,0,bullet_enemy_ring);
			br.number = 4;
			br.size = 0;
			br.extra_angle = 90;
			br.mark = mark;
			with(br){
				image_angle = 360/number;
				for(i=0;i<number;i+=1){
					blt[i] = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt[i].image_angle = image_angle*i + extra_angle;
					blt[i].image_xscale = 0;
					blt[i].image_yscale = 0;
					Anim_Create(blt[i],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
					Anim_Create(blt[i],"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				}
				enabled = 1;
			}
			Anim_Create(br,"size",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,50,60);
			br.gravity = 0.2;
			br.vspeed = -7;
			br.hspeed = sin(attack_time*349987 mod 18)*2;
			br.rot = sin(attack_time*3917789654)*4;
			Anim_Create(br,"extra_angle",0,0,90,720,360);
		}
	}
	if(attack_time = 60){
		end_attack();
	}
}

var a0 = create_attack(1,attack_0,90);
var a1 = create_attack(2,attack_1,60);
var a2 = create_attack(3,attack_2,90);

fixed_sequence = [a0,a1,a2]