//live;
event_inherited();

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
	with(enemy_blockbullet){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
	with(bullet_enemy_ring){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
}

attack_0 = function(laser=0){//旋转散射加反弹闪电球
	live_name = "emitter_spikx_flarebolt:attack_0";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_intro);
	}
	if(attack_time = 69){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1);
	}
	if(attack_time > 70&&attack_time <= 100&&attack_time mod 10 = 0){
		for(i=0;i<20;i+=1){
			dir = i*18-90+(attack_time);
			blt = MakeEnemyBullet(x+lengthdir_x(40,dir),y+lengthdir_y(40,dir),bullet_enemy_normal,spr_bullet_enemy_normal_5);
			blt.image_index = 1;
			blt.image_angle = dir;
			blt.direction = dir;
			blt.speed = 7;
			Anim_Create(blt,"image_angle",0,0,blt.image_angle,200,300);
			Anim_Create(blt,"direction",0,0,blt.direction,200,300);
		}
	}
	if(attack_time = 100){
		for(i=0;i<4;i+=1){
			dir = i*30-135;
			lb = MakeEnemyBullet(x,y,bullet_enemy_lightning_ball_small);
			lb.direction = dir;
			lb.speed = 5;
			lb.bounce = 0;
			lb.bounce_max = 3-laser*2;
			with(lb){
				custom_function = function(){
					if(bounce < bounce_max){
						if(x <= 50 || x >= room_width-50){
							if(x <= 50)x = 50;
							if(x >= room_width)x = room_width-50;
							hspeed *= -1;
							bounce += 1;
						}
						if(y <= 50 || y >= room_height-50){
							if(y <= 50)y = 50;
							if(y >= room_height)y = room_height-50;
							vspeed *= -1;
							bounce += 1;
						}
					}
				}
			}
		}
		if(laser = 1){
			ll = MakeEnemyBullet(x-42,y+120,bullet_enemy_laser_medium);
			ll.duration = 30;
			ll.delay = 90;
			ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
			ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
			ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
			ll.sprite_laser = spr_bullet_enemy_laser_red;
			ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
			ll = MakeEnemyBullet(x+42,y+120,bullet_enemy_laser_medium);
			ll.duration = 30;
			ll.delay = 90;
			ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
			ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
			ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
			ll.sprite_laser = spr_bullet_enemy_laser_red;
			ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
		}
	}
	if(attack_time > 100&&attack_time <= 130&&attack_time mod 10 = 0){
		for(i=0;i<20;i+=1){
			dir = i*18-90+(attack_time);
			blt = MakeEnemyBullet(x+lengthdir_x(40,dir),y+lengthdir_y(40,dir),bullet_enemy_normal,spr_bullet_enemy_normal_5);
			blt.image_index = 1;
			blt.image_angle = dir;
			blt.direction = dir;
			blt.speed = 7;
			Anim_Create(blt,"image_angle",0,0,blt.image_angle,-200,300);
			Anim_Create(blt,"direction",0,0,blt.direction,-200,300);
		}
	}
	if(attack_time > 130&&attack_time <= 160&&attack_time mod 10 = 0){
		for(i=0;i<20;i+=1){
			dir = i*18-90+(attack_time);
			blt = MakeEnemyBullet(x+lengthdir_x(40,dir),y+lengthdir_y(40,dir),bullet_enemy_normal,spr_bullet_enemy_normal_5);
			blt.image_index = 1;
			blt.image_angle = dir;
			blt.direction = dir;
			blt.speed = 7;
			Anim_Create(blt,"image_angle",0,0,blt.image_angle,-200,300);
			Anim_Create(blt,"direction",0,0,blt.direction,200,300);
		}
	}
	if(attack_time > 160&&attack_time <= 190&&attack_time mod 10 = 0){
		for(i=0;i<20;i+=1){
			dir = i*18-90+(attack_time);
			blt = MakeEnemyBullet(x+lengthdir_x(40,dir),y+lengthdir_y(40,dir),bullet_enemy_normal,spr_bullet_enemy_normal_5);
			blt.image_index = 1;
			blt.image_angle = dir;
			blt.direction = dir;
			blt.speed = 7;
			Anim_Create(blt,"image_angle",0,0,blt.image_angle,-200,300);
			Anim_Create(blt,"direction",0,0,blt.direction,-200,300);
		}
	}
	if(attack_time = 190){
		for(i=0;i<3;i+=1){
			dir = i*120+90;
			lb = MakeEnemyBullet(x,y,bullet_enemy_lightning_ball_small);
			lb.direction = dir;
			lb.speed = 7;
			lb.bounce = 0;
			lb.bounce_max = 2-laser*2;
			with(lb){
				custom_function = function(){
					if(bounce < bounce_max){
						if(x <= 50 || x >= room_width-50){
							if(x <= 50)x = 50;
							if(x >= room_width)x = room_width-50;
							hspeed *= -1;
							bounce += 1;
						}
						if(y <= 50 || y >= room_height-50){
							if(y <= 50)y = 50;
							if(y >= room_height)y = room_height-50;
							vspeed *= -1;
							bounce += 1;
						}
					}
				}
			}
		}
		if(laser = 1){
			ll = MakeEnemyBullet(x-82,y+30,bullet_enemy_laser_medium);
			ll.image_angle -= 30;
			ll.duration = 30;
			ll.delay = 30;
			ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
			ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
			ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
			ll.sprite_laser = spr_bullet_enemy_laser_red;
			ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
			ll = MakeEnemyBullet(x+82,y+30,bullet_enemy_laser_medium);
			ll.image_angle += 30;
			ll.duration = 30;
			ll.delay = 30;
			ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
			ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
			ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
			ll.sprite_laser = spr_bullet_enemy_laser_red;
			ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
		}
	}
	if(attack_time = 200){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_outro);
	}
	if(attack_time = 250){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_1 = function(){//绕点旋转子弹阵列
	live_name = "emitter_spikx_flarebolt:attack_1";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack_time < 200&&attack_time mod 3 = 0){
		br = instance_create_depth(x,y,0,bullet_enemy_ring);
		br.mark = mark;
		br.number = 3;
		br.size = 0;
		br.rott = -90+attack_time*1.8;
		with(br){
			image_angle = 360/number
			for(i=0;i<number;i+=1){
				blt[i] = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			}
			enabled = true;
		}
		br.direction = (attack_time-1)*10;
		Anim_Create(br,"size",0,0,0,100,20);
		Anim_Create(br,"rot",0,0,0,1,0,20);
		Anim_Create(br,"speed",0,0,0,6,10,20);
	}
	if(attack_time = 230){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_2 = function(){//随机数量子弹扩散
	live_name = "emitter_spikx_flarebolt:attack_2";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_intro);
	}
	if(attack_time = 69){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1);
	}
	if(attack_time >= 70&&attack_time < 180){
		rdm0 = abs(cos(attack_time*114514)-0.5)*350324;
		rdm1 = abs(cos(attack_time*951753)-0.5)*350324;
		rdm2 = abs(cos(attack_time*233666)-0.5)*350324;
		if(attack_time mod 12 = 0){
			xx = x-42;
			yy = y+120;
			nn = 3 + ceil(rdm0) mod 4;
			exang = 0;
			if(nn = 3||nn = 5)exang = 90;
			if(nn = 4)exang = 45;
			if(nn = 6)exang = 60;
			for(i=0;i<nn;i+=1){
				dir = 360/nn*i+exang;
				blt = MakeEnemyBullet(xx+lengthdir_x(20,dir),yy+lengthdir_y(20,dir),bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = -90-45;
				blt.speed = 6;
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				Anim_Create(blt,"direction",0,0,0,dir,0,60);
				Anim_Create(blt,"image_xscale",0,0,blt.image_xscale,1-blt.image_xscale,0,60);
				Anim_Create(blt,"image_yscale",0,0,blt.image_yscale,1-blt.image_yscale,0,60);
			}
			xx = x;
			yy = y+120;
			nn = 3 + ceil(rdm1) mod 4;
			exang = 0;
			if(nn = 3||nn = 5)exang = 90;
			if(nn = 4)exang = 45;
			if(nn = 6)exang = 60;
			for(i=0;i<nn;i+=1){
				dir = 360/nn*i+exang
				blt = MakeEnemyBullet(xx+lengthdir_x(20,dir),yy+lengthdir_y(20,dir),bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = -90;
				blt.speed = 6;
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				Anim_Create(blt,"direction",0,0,0,dir,0,60);
				Anim_Create(blt,"image_xscale",0,0,blt.image_xscale,1-blt.image_xscale,0,60);
				Anim_Create(blt,"image_yscale",0,0,blt.image_yscale,1-blt.image_yscale,0,60);
			}
			xx = x+42;
			yy = y+120;
			nn = 3 + ceil(rdm2) mod 4;
			exang = 0;
			if(nn = 3||nn = 5)exang = 90;
			if(nn = 4)exang = 45;
			if(nn = 6)exang = 60;
			for(i=0;i<nn;i+=1){
				dir = 360/nn*i+exang
				blt = MakeEnemyBullet(xx+lengthdir_x(20,dir),yy+lengthdir_y(20,dir),bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = -90+45;
				blt.speed = 6;
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				Anim_Create(blt,"direction",0,0,0,dir,0,60);
				Anim_Create(blt,"image_xscale",0,0,blt.image_xscale,1-blt.image_xscale,0,60);
				Anim_Create(blt,"image_yscale",0,0,blt.image_yscale,1-blt.image_yscale,0,60);
			}
		}
	}
	if(attack_time = 180){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_outro);
	}
	if(attack_time = 230){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_3 = function(){//散射红黄子弹加蓝针狙
	live_name = "emitter_spikx_flarebolt:attack_3";
	live;
	if(attack_time = 1){
		bnl = 0;
		bntime = 0;
		bnx = 0;
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_0);
	}
	if(bnl = 1){
		bntime += 1;
		if(bntime = 1){
			dir = -90;
			if(Player_IsEnabled()){
				dir = point_direction(x+bnx,y+70,player.x,player.y);
			}
		}
		if(bntime mod 3 = 1){
			bn = MakeEnemyBullet(x+bnx,y+70,bullet_enemy_blueneedle);
			bn.direction = dir;
			bn.image_angle = bn.direction;
			bn.image_xscale = 0.25;
			Anim_Create(bn,"speed",0,0,25,-8,15);
			Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,2.7-bn.image_xscale,15);
		}
		if(bntime = 13){
			bnl = 0;
			bntime = 0;
		}
	}
	if(attack_time <= 250){
		if(attack_time mod 35 = 0){
			for(i=0;i<16;i+=1){
				exspd = (sin(i/16*pi*4+(attack_time/2))/2+0.5)*3;
				blt = MakeEnemyBullet(x+lengthdir_x(60,360/16*i),y+lengthdir_y(60,360/16*i),bullet_enemy_normal,spr_bullet_enemy_normal_5);
				blt.image_angle = 360/16*i;
				blt.direction = 360/16*i;
				blt.speed = 5 + exspd;
			}
		}
		if(attack_time mod 25 = 0){
			for(i=0;i<16;i+=1){
				exspd = (sin(i/16*pi*4-(attack_time/2))/2+0.5)*3;
				blt = MakeEnemyBullet(x+lengthdir_x(60,360/16*i),y+lengthdir_y(60,360/16*i),bullet_enemy_normal,spr_bullet_enemy_normal_5);
				blt.image_index = 1;
				blt.image_angle = 360/16*i+11.25;
				blt.direction = 360/16*i+11.25;
				blt.speed = 5 + exspd;
			}
		}
		if(attack_time mod 40 = 0){
			dd = (attack_time div 40) mod 2;
			bnl = 1;
			if(dd = 1){
				bnx = -40;
			}
			if(dd = 0){
				bnx = 40;
			}
		}
	}
	if(attack_time = 250){
		mark.SetIdle();
		end_attack();
	}
}
	
attack_4 = function(){//斜四向红黄子弹加蓝针狙
	live_name = "emitter_spikx_flarebolt:attack_4";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_intro);
		bnl = 0;
		bntime = 0;
	}
	if(attack_time = 69){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1);
	}
	if(attack_time = 70||attack_time = 200){
		for(i=0;i<8;i+=1){
			dir = i*45+22.5;
			nn = i div 2;
			dd = nn mod 2;
			for(j=0;j<25;j+=1){
				blt = MakeEnemyBullet(x+lengthdir_x(100,dir),y+lengthdir_y(100,dir),bullet_enemy_normal,spr_bullet_enemy_normal_5);
				blt.image_index = j mod 2;
				blt.image_angle = 45+nn*90;
				blt.direction = 45+nn*90+(j mod 2 = 0 ? -90 : 90);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,lengthdir_x(20*(j+1),45+nn*90),30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,lengthdir_y(20*(j+1),45+nn*90),30);
				Anim_Create(blt,"speed",0,0,0,7,40,40+j+60);
			}
		}
	}
	if(attack_time > 70&&attack_time < 400){
		if(bnl = 1){
			bntime += 1;
			if(bntime = 1){
				dirl = -90;
				if(Player_IsEnabled()){
					dirl = point_direction(x+42,y+120,player.x,player.y);
				}
				dirr = -90;
				if(Player_IsEnabled()){
					dirr = point_direction(x-42,y+120,player.x,player.y);
				}
			}
			if(bntime mod 3 = 1){
				bn = MakeEnemyBullet(x+42,y+120,bullet_enemy_blueneedle);
				bn.direction = dirl;
				bn.image_angle = bn.direction;
				bn.image_xscale = 0.25;
				Anim_Create(bn,"speed",0,0,25,-8,15);
				Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,2.7-bn.image_xscale,15);
				bn = MakeEnemyBullet(x-42,y+120,bullet_enemy_blueneedle);
				bn.direction = dirr;
				bn.image_angle = bn.direction;
				bn.image_xscale = 0.25;
				Anim_Create(bn,"speed",0,0,25,-8,15);
				Anim_Create(bn,"image_xscale",0,0,bn.image_xscale,2.7-bn.image_xscale,15);
			}
			if(bntime = 10){
				bnl = 0;
				bntime = 0;
			}
		}
		if(attack_time mod 25 = 0){
			bnl = 1;
		}
	}
	if(attack_time = 400){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_outro);
	}
	if(attack_time = 450){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_5 = function(){//波粒加激光
	live_name = "emitter_spikx_flarebolt:attack_5";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_intro);
		dd = 0;
		rotspd = 0;
	}
	if(attack_time = 69){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1);
	}
	if(attack_time = 70||attack_time = 150||attack_time = 230){
		ll = MakeEnemyBullet(x-42,y+120,bullet_enemy_laser_medium);
		ll.delay = 120;
		ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
		ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
		ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		ll.sprite_laser = spr_bullet_enemy_laser_red;
		ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
		ll = MakeEnemyBullet(x+42,y+120,bullet_enemy_laser_medium);
		ll.delay = 120;
		ll.sprite_ball = spr_bullet_enemy_laser_red_ball;
		ll.sprite_ring = spr_bullet_enemy_laser_red_ring;
		ll.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		ll.sprite_laser = spr_bullet_enemy_laser_red;
		ll.sprite_effect = spr_bullet_enemy_effect_laser_red;
	}
	if(attack_time > 70&&attack_time < 300){
		if(attack_time mod 5 = 0){
			for(i=0;i<4;i+=1){
				rotspd = 3;
				dd += rotspd;
				blt = MakeEnemyBullet(x+lengthdir_x(100,dd+i*90),y+40+lengthdir_y(100,dd+i*90),bullet_enemy_normal,spr_bullet_enemy_normal_5);
				if(i mod 2 = 0)blt.image_index = 1;
				blt.image_angle = dd+i*90+attack_time;
				blt.direction = dd+i*90+attack_time;
				Anim_Create(blt,"speed",0,0,5,-14,60);
				blt = MakeEnemyBullet(x+lengthdir_x(100,-dd+i*90),y+40+lengthdir_y(100,-dd+i*90),bullet_enemy_normal,spr_bullet_enemy_normal_5);
				if(i mod 2 = 1)blt.image_index = 1;
				blt.image_angle = -dd+i*90+attack_time;
				blt.direction = -dd+i*90+attack_time;
				Anim_Create(blt,"speed",0,0,5,-14,60);
			}
		}
	}
	if(attack_time = 330){
		mark.SetSequence(seq_enemy_boss_mini_og0_attack_1_outro);
	}
	if(attack_time = 380){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(0,attack_1,30)
a2 = create_attack(0,attack_2,30)
a3 = create_attack(0,attack_3,30)
a4 = create_attack(0,attack_4,30)
a5 = create_attack(0,attack_5,30)
a6 = create_attack(0,attack_0,40,0.5,1)

fixed_sequence = [a0,a1,a2,a3,a4,a5,a6,a4,a0]
random_pool = [a0,a1,a2,a3,a4,a5,a6,a4,a0]