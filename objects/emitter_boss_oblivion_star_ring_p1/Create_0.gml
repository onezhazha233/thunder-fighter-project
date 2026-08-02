//live;
event_inherited();

get_target_dir = function(){
	var _tx = instance_exists(player) ? player.x : mouse_x;
	var _ty = instance_exists(player) ? player.y : mouse_y;
	return point_direction(x, y, _tx, _ty);
}

attack_0 = function(){//中间红反弹外侧三蓝
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_0";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,60,30);
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
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,60,-60,30);
	}
	if(attack_time = 150){
		end_attack();
	}
}

attack_1 = function(dir=0){//固定激光加扫射加狙
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_1";
	live;
	if(attack_time = 1){
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-60,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,90,25);
		gun_rot = 0;
		rn = 0;
	}
	if(attack_time = 40){
		for(i=0;i<3;i+=1){
			laser[i] = MakeEnemyLaser(2,x+lengthdir_x(250,-30+i*120),y+lengthdir_y(250,-30+i*120),2,-30+i*120,30,200);
		}
		Anim_Create(id,"gun_rot",0,0,0,1,20);
		Anim_Create(id,"gun_rot",0,0,1,1,20,75);
		Anim_Create(id,"gun_rot",0,0,2,1,20,150);
	}
	if(attack_time >= 40){
		mark.gun_angle += gun_rot*(dir=0 ? 1 : -1);
		for(i=0;i<3;i+=1){
			if(instance_exists(laser[i])){
				laser[i].x = x+lengthdir_x(250,-30+i*120);
				laser[i].y = y+lengthdir_y(250,-30+i*120);
			}
		}
		if(attack_time < 300){
			if(attack_time mod 5 = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<5;j+=1){
						dd = mark.gun_angle + 30 + i*120;
						blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
						blt.image_xscale = 1.5;
						blt.image_yscale = 1.5;
						blt.direction = dd-50+j*25;
						blt.speed = 10+(attack_time-40)/60*(j mod 2 = 1);
					}
				}
			}
		}
		if(attack_time mod 100 = 50&&rn < 3){
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
		if(attack_time mod 100 = 70&&rn < 3){
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
			rn += 1;
		}
	}
	if(attack_time = 300){
		Anim_Create(id,"gun_rot",0,0,gun_rot,-gun_rot,30);
	}
	if(attack_time = 330){
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,60,-60,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,(mark.gun_angle) mod 120,-(mark.gun_angle) mod 120,30);
	}
	if(attack_time = 360){
		end_attack();
	}
}

attack_2 = function(dir=0){//红蓝扇形散射
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_2";
	live;
	if(attack_time = 1){
		gun_rot = 0;
		ring_rot = 0;
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,-60*(dir=0 ? 1 : -1),25);
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,90*(dir=0 ? 1 : -1),40,25);
		Anim_Create(id,"gun_rot",0,0,0,3,60,25);
		Anim_Create(id,"ring_rot",0,0,0,-1,30,65);
	}
	if(attack_time > 1){
		mark.gun_angle += gun_rot*(dir=0 ? 1 : -1);
		mark.ring_angle += ring_rot*(dir=0 ? 1 : -1);
	}
	if(attack_time < 330){
		if(attack_time >= 25){
			if(attack_time mod 16 = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<9;j+=1){
						dd = mark.gun_angle + 30 + i*120;
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
						dd = mark.ring_angle + 30 + i*120;
						blt = MakeEnemyBullet(x+lengthdir_x(250,dd),y+lengthdir_y(250,dd),bullet_enemy_normal);
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
	if(attack_time = 300){
		Anim_Create(id,"gun_rot",0,0,gun_rot,-gun_rot,30);
		Anim_Create(id,"ring_rot",0,0,ring_rot,-ring_rot,30);
	}
	if(attack_time = 330){
		mark.SetIdle();
	}
	if(attack_time = 360){
		end_attack();
	}
}
	
attack_3 = function(dir=0){//反弹子弹加蓝针
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_3";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,30*(dir=0 ? 1 : -1),25);
	}
	if(attack_time > 30&&attack_time < 400){
		if(attack_time mod 9 = 0){
			for(i=0;i<3;i+=1){
				for(j=0;j<3;j+=1){
					dd = mark.gun_angle + 30 + i*120;
					blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.image_xscale = 1.3;
					blt.image_yscale = 1.3;
					blt.direction = dd - 20 + j*20;
					blt.image_angle = blt.direction;
					blt.speed = 10;
					with(blt){
						bounced = 0;
						custom_function = function(){
							if(bounced < 3){
								if(x <= 0 || x >= room_width){
									if(x <= 0)x = 0;
									if(x >= room_width)x = room_width;
									hspeed *= -1;
									image_angle = direction;
									bounced += 1;
								}
								if(y <= 0 || y >= room_height){
									if(y <= 0)y = 0;
									if(y >= room_height)y = room_height;
									vspeed *= -1;
									image_angle = direction;
									bounced += 1;
								}
							}
						}
					}
				}
			}
		}
		if(attack_time >= 120&&attack_time < 144){
			tt = attack_time - 120;
			for(i=0;i<3;i+=1){
				dd = 30+mark.ring_angle+i*120;
				bn = MakeEnemyBullet(x+lengthdir_x(250,dd)+lengthdir_x(120,dd+tt*15),y+lengthdir_y(250,dd)+lengthdir_y(120,dd+tt*15),bullet_enemy_blueneedle,,1);
				bn.image_xscale = 0;
				bn.image_yscale = 2;
				Anim_Create(bn,"image_xscale",0,0,0,2,20);
				Anim_Create(bn,"image_yscale",0,0,2,-1,20);
				bn.direction = dd+tt*15;
				bn.image_angle = dd+tt*15;
				Anim_Create(bn,"speed",0,0,-5,5,20);
				Anim_Create(bn,"speed",0,0,0,8,30,60-tt);
			}
		}
		if(attack_time = 240){
			Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,60*(dir=0 ? -1 : 1),30);
		}
		if(attack_time >= 300&&attack_time < 324){
			tt = attack_time - 300;
			for(i=0;i<3;i+=1){
				dd = 30+mark.ring_angle+i*120;
				bn = MakeEnemyBullet(x+lengthdir_x(250,dd)+lengthdir_x(120,dd+tt*15),y+lengthdir_y(250,dd)+lengthdir_y(120,dd+tt*15),bullet_enemy_blueneedle,,1);
				bn.image_xscale = 0;
				bn.image_yscale = 2;
				Anim_Create(bn,"image_xscale",0,0,0,2,20);
				Anim_Create(bn,"image_yscale",0,0,2,-1,20);
				bn.direction = dd+tt*15;
				bn.image_angle = dd+tt*15;
				Anim_Create(bn,"speed",0,0,-5,5,20);
				Anim_Create(bn,"speed",0,0,0,8,30,60-tt);
			}
		}
	}
	if(attack_time = 420){
		mark.SetIdle();
		mark.SetMoveEnabled(true);
	}
	if(attack_time = 450){
		end_attack();
	}
}
	
attack_4 = function(dir=0){//红蓝旋转散射
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_4";
	live;
	if(attack_time = 1){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,60*(dir=0 ? 1 : -1),25);
	}
	if(attack_time > 30&&attack_time < 300){
		mark.gun_angle -= 2*(dir=0 ? 1 : -1);
		mark.ring_angle += 1*(dir=0 ? 1 : -1);
		if(attack_time mod 15 = 0){
			for(i=0;i<12;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
				blt.image_index = ((attack_time div 15) mod 2 = 0);
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				blt.direction = -attack_time*3*(dir=0 ? 1 : -1) + i*30;
				blt.image_angle = blt.direction;
				blt.speed = 6;
				with(blt){
					dd = dir;
					time = 0;
					custom_function = function(){
						time += 1;
						image_angle = direction;
						direction -= 0.5*(dd=0 ? 1 : -1);
						if(time = 20||time = 40){
							blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
							blt.image_index = image_index;
							blt.depth = depth - 1;
							blt.image_xscale = 0;
							Anim_Create(blt,"image_xscale",0,0,0,2,20);
							blt.direction = direction;
							blt.image_angle = blt.direction;
							blt.speed = speed + 4 - time/20;
							Anim_Create(blt,"direction",0,0,blt.direction,-10*(dd=0 ? 1 : -1),60);
							with(blt){
								custom_function = function(){
									image_angle = direction;
								}
							}
							if(time = 40){
								blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
								blt.image_xscale = 1.5;
								blt.image_yscale = 1.5;
								blt.image_index = image_index;
								blt.depth = depth - 1;
								blt.direction = direction;
								blt.image_angle = blt.direction;
								blt.speed = speed;
								blt.dd = dd;
								with(blt){
									direction -= 0.6*(dd=0 ? 1 : -1);
									custom_function = function(){
										image_angle = direction;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 330){
		mark.SetIdle();
	}
	if(attack_time = 360){
		end_attack();
	}
}

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,30)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,30)
a4 = create_attack(4,attack_4,30)
a5 = create_attack(5,attack_1,30,,1)
a6 = create_attack(6,attack_2,30,,1)
a7 = create_attack(7,attack_3,30,,1)
a8 = create_attack(8,attack_4,30,,1)

fixed_sequence = [a0,a1,a2,a0,a3,a4,a0,a5,a6,a0,a8]
random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8]

//enabled = true