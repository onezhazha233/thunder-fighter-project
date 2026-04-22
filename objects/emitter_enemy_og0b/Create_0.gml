//live;
event_inherited();

mode = EMITTER_MODE.FIXED;

attack_0 = function(){
	live_name = "emitter_enemy_og0b:attack_0";
	live;
	if(attack_time < 40){
		if(attack_time mod 4 = 0){
			nn = attack_time div 4;
			if(nn > 5)nn = abs(10-nn);
			if(nn > 1){
				for(i=0;i<nn;i+=1){
					a = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = -90-nn*15/2+i*nn*15/(nn-1);
					a.direction = a.image_angle;
					a.speed = 10;
				}
			}
			else{
				a = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				a.image_angle = -90;
				a.direction = a.image_angle;
				a.speed = 10;
			}
		}
	}
	if(attack_time = 40){
		end_attack();
	}
}

attack_1 = function(){
	live_name = "emitter_enemy_og0b:attack_1";
	live;
	if(attack_time = 1){
		for(j=0;j<2;j+=1){
			for(i=0;i<2;i+=1){
				bn = MakeEnemyBullet(x-50+j*100,y+20,bullet_enemy_blueneedle);
				bn.image_xscale = 0.25;
				bn.image_angle = -90-10+20*i;
				bn.direction = bn.image_angle;
				bn.speed = 5;
				Anim_Create(bn,"speed",0,0,5,-4,40);
				Anim_Create(bn,"speed",0,0,1,14,10,40);
				Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,3,15,40);
				Anim_Create(bn,"direction",0,0,bn.direction,-90-bn.direction,0,40);
				Anim_Create(bn,"image_angle",0,0,bn.image_angle,-90-bn.image_angle,0,40);
			}
		}
	}
	if(attack_time = 30){
		for(j=0;j<2;j+=1){
			for(i=0;i<3;i+=1){
				bn = MakeEnemyBullet(x-50+j*100,y+20,bullet_enemy_blueneedle);
				bn.image_xscale = 0.25;
				bn.image_angle = -90-40+40*i;
				bn.direction = bn.image_angle;
				bn.speed = 5;
				Anim_Create(bn,"speed",0,0,5,-4,40);
				Anim_Create(bn,"speed",0,0,1,14,10,40);
				Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,3,15,40);
				Anim_Create(bn,"direction",0,0,bn.direction,-90-bn.direction,0,40);
				Anim_Create(bn,"image_angle",0,0,bn.image_angle,-90-bn.image_angle,0,40);
			}
		}
	}
	if(attack_time = 80){
		for(j=0;j<2;j+=1){
			for(i=0;i<4;i+=1){
				bn = MakeEnemyBullet(x-50+j*100,y+20,bullet_enemy_blueneedle);
				bn.image_xscale = 0.25;
				bn.image_angle = -90-30+20*i;
				bn.direction = bn.image_angle;
				bn.speed = 10;
				Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,3,15);
			}
		}
	}
	if(attack_time = 90){
		end_attack();
	}
}

attack_2 = function(){
	live_name = "emitter_enemy_og0b:attack_2";
	live;
	if(attack_time < 45){
		if(attack_time mod 3 = 0){
			nn = attack_time div 3;
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x+lengthdir_x(30,-90+nn*20),y+lengthdir_y(30,-90+nn*20),bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = -90-10 + i*10+nn*20;
				blt.speed = 8;
				Anim_Create(blt,"speed",0,0,8,-16,40);
				blt = MakeEnemyBullet(x+lengthdir_x(30,-90-nn*20),y+lengthdir_y(30,-90-nn*20),bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = -90+10 - i*10-nn*20;
				blt.speed = 8;
				Anim_Create(blt,"speed",0,0,8,-16,40);
			}
		}
	}
	if(attack_time = 90){
		end_attack();
	}
}

var a0 = create_attack(1,attack_0,60);
var a1 = create_attack(2,attack_1,60);
var a2 = create_attack(3,attack_2,60);

fixed_sequence = [a0,a1,a2]