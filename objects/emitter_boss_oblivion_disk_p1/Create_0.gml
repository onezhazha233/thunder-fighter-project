//live;
event_inherited();

get_target_dir = function(){
	var _tx = instance_exists(player) ? player.x : mouse_x;
	var _ty = instance_exists(player) ? player.y : mouse_y;
	return point_direction(x, y, _tx, _ty);
}

attack_0 = function(){//中间红反弹外侧三蓝
	live_name = "emitter_boss_oblivion_disk_p1:attack_0";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_large_og2_p1_attack_0);
	}
	if(attack_time < 17&&attack_time mod 2 = 1){
		tt = attack_time div 2;
		for(j=0;j<3;j+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(120,120/8*tt+j*120),20);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(120,120/8*tt+j*120),20);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x+lengthdir_x(120,120/8*tt+j*120),-lengthdir_x(20,120/8*tt+j*120),20,20);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y+lengthdir_y(120,120/8*tt+j*120),-lengthdir_y(20,120/8*tt+j*120),20,20);
			with(blt){
				bounced = false;
				custom_function = function(){
					if(!bounced){
						if(x <= 0 || x >= room_width){
							if(x <= 0)x = 0;
							if(x >= room_width)x = room_width;
							hspeed *= -1;
							bounced = true;
						}
						if(y <= 0 || y >= room_height){
							if(y <= 0)y = 0;
							if(y >= room_height)y = room_height;
							vspeed *= -1;
							bounced = true;
						}
					}
				}
			}
			blt.direction = 120/8*tt+j*120;
			Anim_Create(blt,"speed",0,0,0,6,30,60-tt*2);
		}
	}
	if(attack_time = 40){
		for(i=0;i<20;i+=1){
			blt = MakeEnemyBullet(x+lengthdir_x(250,90),y+lengthdir_y(250,90),bullet_enemy_normal);
			blt.image_index = 1;
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,lengthdir_x(90,360/20*i),20);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,lengthdir_y(90,360/20*i),20);
			blt.direction = 360/20*i;
			Anim_Create(blt,"speed",0,0,0,12,30,80);
		}
	}
	if(attack_time = 50){
		for(i=0;i<20;i+=1){
			blt = MakeEnemyBullet(x+lengthdir_x(250,-150),y+lengthdir_y(250,-150),bullet_enemy_normal);
			blt.image_index = 1;
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,lengthdir_x(90,360/20*i),20);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,lengthdir_y(90,360/20*i),20);
			blt.direction = 360/20*i;
			Anim_Create(blt,"speed",0,0,0,12,30,70);
		}
	}
	if(attack_time = 60){
		for(i=0;i<20;i+=1){
			blt = MakeEnemyBullet(x+lengthdir_x(250,-30),y+lengthdir_y(250,-30),bullet_enemy_normal);
			blt.image_index = 1;
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,lengthdir_x(90,360/20*i),20);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,lengthdir_y(90,360/20*i),20);
			blt.direction = 360/20*i;
			Anim_Create(blt,"speed",0,0,0,12,30,60);
		}
	}
	if(attack_time = 90){
		mark.SetMoveEnabled(true);
		mark.SetSequence(seq_enemy_boss_large_og2_p1_attack_0,seqdir_left);
	}
	if(attack_time = 150){
		end_attack();
	}
}

attack_1 = function(){//固定激光加扫射加狙
	live_name = "emitter_boss_oblivion_disk_p1:attack_1";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_large_og2_p1_attack_1_intro);
	}
	if(attack_time = 40){
		for(i=0;i<3;i+=1){
			laser[i] = MakeEnemyLaser(2,x+lengthdir_x(250,-30+i*120),y+lengthdir_y(250,-30+i*120),2,-30+i*120,30,200);
		}
	}
	if(attack_time >= 40){
		for(i=0;i<3;i+=1){
			if(instance_exists(laser[i])){
				laser[i].x = x+lengthdir_x(250,-30+i*120);
				laser[i].y = y+lengthdir_y(250,-30+i*120);
			}
		}
		if(attack_time < 275){
			if(attack_time mod 5 = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<5;j+=1){
						dd = -30+i*120-(attack_time-40)*(63/39);
						blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
						blt.image_xscale = 1.5;
						blt.image_yscale = 1.5;
						blt.direction = dd-50+j*25;
						blt.speed = 12+(attack_time-40)/30*(j mod 2 = 1);
					}
				}
			}
		}
		if(attack_time mod 90 = 0){
			dd = get_target_dir();
			for(i=0;i<5;i+=1){
				bn = MakeEnemyBullet(x,y,bullet_enemy_blueneedle,spr_bullet_enemy_purpleneedle);
				bn.direction = dd-20+i*10;
				bn.image_angle = bn.direction;
				bn.speed = 6;
				Anim_Create(bn,"speed",0,0,3,20,0,60);
				bn.image_xscale = 0;
				Anim_Create(bn,"image_xscale",0,0,0,1,10);
				Anim_Create(bn,"image_xscale",0,0,1,2,10,60);
				bn.effect_dist = 40;
			}
		}
		if(attack_time mod 90 = 20){
			dd = get_target_dir();
			for(i=0;i<4;i+=1){
				bn = MakeEnemyBullet(x,y,bullet_enemy_blueneedle,spr_bullet_enemy_purpleneedle);
				bn.direction = dd-24+i*16;
				bn.image_angle = bn.direction;
				bn.speed = 6;
				Anim_Create(bn,"speed",0,0,3,20,0,60);
				bn.image_xscale = 0;
				Anim_Create(bn,"image_xscale",0,0,0,1,10);
				Anim_Create(bn,"image_xscale",0,0,1,2,10,60);
				bn.effect_dist = 40;
			}
		}
	}
	if(attack_time = 301){
		mark.SetSequence(seq_enemy_boss_large_og2_p1_attack_1_outro);
	}
	if(attack_time = 331){
		end_attack();
	}
}

attack_2 = function(){//红蓝散射
	live_name = "emitter_boss_oblivion_disk_p1:attack_2";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_large_og2_p1_attack_2);
	}
	if(attack_time < 335){
		if(attack_time >= 25){
			if(attack_time mod 16 = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<9;j+=1){
						dd = -30+i*120+(attack_time-25)*(60/31);
						blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
						blt.image_xscale = 0;
						blt.image_yscale = 0;
						Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,10);
						Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,10);
						blt.direction = dd-16+j*4;
						blt.speed = 5;
					}
				}
			}
		}
		if(attack_time >= 50){
			if(attack_time mod 25 = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<11;j+=1){
						dd = -30+i*120-(attack_time-50)*(126/95);
						blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
						blt.image_index = 1;
						blt.image_xscale = 0;
						blt.image_yscale = 0;
						Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,10);
						Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,10);
						blt.direction = dd-20+j*4;
						blt.speed = 10;
					}
				}
			}
		}
	}
	if(attack_time = 361){
		mark.SetIdle();
		end_attack();
	}
}
	
attack_3 = function(){
	live_name = "emitter_boss_oblivion_disk_p1:attack_3";
	live;
}

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,30)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,30)
//a1 = create_attack(1,attack_1,40)
//a2 = create_attack(2,attack_2,30)
//a3 = create_attack(3,attack_3,40)
//a4 = create_attack(4,attack_4,30)

//fixed_sequence = [a1,a0,a3,a2,a4]
//random_pool = [a0,a1,a2,a3,a4]
fixed_sequence = [a0,a2,a2,a0]
random_pool = [a0,a1,a2]

//enabled = true