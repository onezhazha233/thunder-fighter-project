//live;
event_inherited();

top_red_thickness = 0

get_target_dir = function(){
	var _tx = instance_exists(player) ? player.x : mouse_x;
	var _ty = instance_exists(player) ? player.y : mouse_y;
	return point_direction(x, y, _tx, _ty);
}

get_laser_edge = function(){
	edge_point = [];
	with(bullet_enemy_laser_big){
		var _dx = lengthdir_x(1,image_angle);
		var _dy = lengthdir_y(1,image_angle);
		var _t = 9999999;
		if(_dx > 0)_t = min(_t,(room_width-x)/_dx);
		else if(_dx < 0)_t = min(_t,(0-x)/_dx);
		if(_dy > 0)_t = min(_t,(room_height-y)/_dy);
		else if(_dy < 0)_t = min(_t,(0-y)/_dy);
		other.edge_point[order] = [x+_dx*_t,y+_dy*_t];
	}
}

get_gun_pos = function(){
	xx = mark.x + mark.gun_xoff;
	yy = mark.y;
	gpx = xx + lengthdir_x(185,mark.gun_angle-90);
	gpy = yy + lengthdir_y(185,mark.gun_angle-90);
	return [gpx,gpy];
}

attack_0 = function(dir=0){//旋转反弹双色弹加扩散追踪弹
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_0";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		corner_rot = 0;
		ring_rot = 0;
		Anim_Create(id,"corner_rot",0,0,0,-1,40);
		Anim_Create(id,"ring_rot",0,0,0,0.7,40);
	}
	if(attack_time > 1){
		mark.corner_angle += corner_rot*(dir=0 ? 1 : -1);
		mark.ring_angle += ring_rot*(dir=0 ? 1 : -1);
		if(attack_time < 450){
			if(attack_time mod 14 = 0){
				for(i=0;i<3;i+=1){
					dd = mark.corner_angle+30+i*120;
					blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.image_angle = dd;
					blt.direction = dd;
					blt.image_xscale = 1.5;
					blt.image_yscale = 1.5;
					blt.speed = 8;
					with(blt){
						bounced = 0;
						custom_function = function(){
							if(bounced < 1){
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
			if(attack_time mod 10 = 0){
				for(i=0;i<3;i+=1){
					dd = mark.ring_angle-30+i*120;
					blt = MakeEnemyBullet(x+lengthdir_x(250,dd),y+lengthdir_y(250,dd),bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.image_index = 1;
					blt.image_angle = dd;
					blt.direction = dd;
					blt.image_xscale = 1.5;
					blt.image_yscale = 1.5;
					blt.speed = 8;
					with(blt){
						bounced = 0;
						custom_function = function(){
							if(bounced < 1){
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
	}
	if(attack_time = 60||attack_time = 120||attack_time = 180||attack_time = 240||attack_time = 300||attack_time = 360){
		for(i=0;i<24;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red_tracking);
			blt.depth -= 5;
			px = mouse_x;
			py = mouse_y;
			dd = -90;
			if(Player_IsEnabled())dd = point_direction(x,y,player.x,player.y);
			blt.direction = dd + i*(360/24);
			blt.speed = 20;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed,30);
			Anim_Create(blt,"speed",0,0,0,blt.speed,20,70);
		}
	}
	if(attack_time = 400){
		Anim_Create(id,"corner_rot",0,0,corner_rot,-corner_rot,30);
		Anim_Create(id,"ring_rot",0,0,ring_rot,-ring_rot,30);
	}
	if(attack_time = 430){
		mark.SetIdle();
	}
	if(attack_time = 430){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_1 = function(dir=0){//反弹红弹
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_1";
	live;
	if(attack_time = 1){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-75*(dir=0 ? 1 : -1),30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45*(dir=0 ? 1 : -1),30);
	}
	if(attack_time = 30||attack_time = 75||attack_time = 120||attack_time = 165){
		mark.GunAttack(1);
		gp = get_gun_pos();
		for(i=0;i<7;i+=1){
			blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_red_tracking);
			blt.direction = mark.gun_angle+15*3-15*i-90;
			blt.speed = 8;
			with(blt){
				bounced = 0;
				custom_function = function(){
					if(bounced < 2){
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
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,60);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,60);
		}
	}
	if(attack_time = 45){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-75*(dir=0 ? 1 : -1),150*(dir=0 ? 1 : -1),30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,45*(dir=0 ? 1 : -1),-90*(dir=0 ? 1 : -1),30);
	}
	if(attack_time = 90){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,75*(dir=0 ? 1 : -1),-150*(dir=0 ? 1 : -1),30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-45*(dir=0 ? 1 : -1),90*(dir=0 ? 1 : -1),30);
	}
	if(attack_time = 135){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-75*(dir=0 ? 1 : -1),150*(dir=0 ? 1 : -1),30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,45*(dir=0 ? 1 : -1),-90*(dir=0 ? 1 : -1),30);
	}
	if(attack_time = 180){
		mark.SetIdle();
	}
	if(attack_time = 240){
		end_attack();
	}
}
	
attack_2 = function(){//垂直红蓝弹加左右散射
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_2";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,-150,40);
		Anim_Create(mark,"corner_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,90,40);
	}
	if(attack_time > 40&&attack_time < 90&&attack_time mod 3 = 0){
		for(i=0;i<3;i+=1){
			for(j=0;j<4;j+=1){
				dd = mark.corner_angle+30+i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal);
				blt.direction = dd-7.5+5*j;
				blt.speed = 20;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				
				dd = mark.ring_angle-30+i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(250,dd),y+lengthdir_y(250,dd),bullet_enemy_normal);
				blt.image_index = 1;
				blt.direction = dd-7.5+5*j;
				blt.speed = 20;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
			}
		}
	}
	if(attack_time = 90){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,-75,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,-20,30);
	}
	if(attack_time = 120||attack_time = 240||attack_time = 360||attack_time = 480){
		for(i=0;i<13;i+=1){
			blt = MakeEnemyBullet(-30,15+i*100,bullet_enemy_normal);
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,20-blt.x,20,i*2);
			Anim_Create(blt,"hspeed",0,0,0,6,30,90+i*10);
			blt = MakeEnemyBullet(-30,65+i*100,bullet_enemy_normal);
			blt.image_index = 1;
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,20-blt.x,20,(15-i)*2);
			Anim_Create(blt,"hspeed",0,0,0,6,30,90+(15-i)*10);
			blt = MakeEnemyBullet(750,15+i*100,bullet_enemy_normal);
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,710-blt.x,20,i*2);
			Anim_Create(blt,"hspeed",0,0,0,-6,30,90+i*10);
			blt = MakeEnemyBullet(750,65+i*100,bullet_enemy_normal);
			blt.image_index = 1;
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,710-blt.x,20,(15-i)*2);
			Anim_Create(blt,"hspeed",0,0,0,-6,30,90+(15-i)*10);
		}
	}
	if(attack_time = 120){
		mark.GunAttack(7);
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-75,150,110);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-20,40,110);
	}
	if(attack_time = 225){
		mark.GunAttack(7);
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,75,-150,110);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,20,-40,110);
	}
	if(attack_time >= 120&&attack_time <= 335){
		if(attack_time mod 15 = 0){
			gp = get_gun_pos();
			for(i=0;i<5;i+=1){
				blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = mark.gun_angle-90-30+i*15;
				blt.direction = blt.image_angle;
				blt.speed = 4;
			}
		}
	}
	if(attack_time = 330){
		mark.GunAttack(7);
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-75,150,110);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-20,40,110);
	}
	if(attack_time = 435){
		mark.GunAttack(7);
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,75,-150,110);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,20,-40,110);
	}
	if(attack_time >= 330&&attack_time <= 530){
		if(attack_time mod 15 = 0){
			gp = get_gun_pos();
			for(i=0;i<5;i+=1){
				blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = mark.gun_angle-90-30+i*15;
				blt.direction = blt.image_angle;
				blt.speed = 4;
			}
		}
	}
	if(attack_time = 540){
		mark.GunAttack(7);
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-75,150,110);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-20,40,110);
	}
	if(attack_time = 645){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,75,-75,50);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,20,-20,50);
	}
	if(attack_time >= 540&&attack_time <= 640){
		if(attack_time mod 15 = 0){
			gp = get_gun_pos();
			for(i=0;i<5;i+=1){
				blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = mark.gun_angle-90-30+i*15;
				blt.direction = blt.image_angle;
				blt.speed = 4;
			}
		}
	}
	if(attack_time = 770){
		mark.SetIdle();
	}
	if(attack_time = 800){
		end_attack();
	}
}
	
attack_3 = function(){//四角星加横排下落
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_3";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,180,30);
	}
	if(attack_time = 30){
		bl = MakeEnemyLaser(2,x,y-185,1,90,60,-1);
		bl.wave_effect = true;
	}
	if(attack_time = 90){
		Anim_Create(bl,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,bl.y,20,20);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.y,20,20);
		Anim_Create(id,"top_red_thickness",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,100,10,10);
	}
	if(attack_time = 110){
		rx = 105;
	}
	if(attack_time = 120){
		Anim_Create(id,"rx",0,0,rx,room_width-rx*2,150);
		Anim_Create(id,"rx",0,0,room_width-rx,105-room_width+rx,150,150);
		Anim_Create(id,"rx",0,0,rx,room_width-rx*2,150,280);
		Anim_Create(id,"rx",0,0,room_width-rx,105-room_width+rx,150,450);
		Anim_Create(id,"rx",0,0,rx,room_width-rx*2,150,600);
	}
	if(attack_time > 110&&attack_time < 700){
		top_red_thickness = 100 + sin((attack_time-100)/2)*3;
		if(attack_time mod 6 = 0){
			xx = room_width/2+sin(attack_time*951+753)*room_width/2
			blt = MakeEnemyBullet(xx,-20,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.image_xscale = 2;
			blt.image_yscale = 2;
			blt.vspeed = 6;
			Anim_Create(blt,"vspeed",0,0,blt.vspeed,6,60);
			blt.duration -= attack_time*321;
			with(blt){
				custom_function = function(){
					image_xscale = 2 + sin(duration/3)*0.2;
					image_yscale = 2 - sin(duration/3)*0.2;
				}
			}
		}
		if(attack_time mod 30 = 0){
			for(i=0;i<7;i+=1){
				blt = MakeEnemyBullet(rx-90+30*i,-30,bullet_enemy_normal);
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				blt.vspeed = 8;
				blt.mm = 1;
				blt = MakeEnemyBullet(720-(rx-90+30*i),-30,bullet_enemy_normal);
				blt.image_xscale = 1.5;
				blt.image_yscale = 1.5;
				blt.vspeed = 8;
				blt.mm = 1;
			}
		}
	}
	if(attack_time = 700){
		bl.duration = 1;
		Anim_Create(bl,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,bl.y,-20,20);
		Anim_Create(id,"top_red_thickness",ANIM_TWEEN.QUAD,ANIM_EASE.IN,100,-100,20);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.y,-20,20);
	}
	if(attack_time = 720){
		mark.SetIdle();
	}
	if(attack_time = 750){
		end_attack();
	}
}
	
attack_4 = function(){//狙和随机交替激光和散射
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_4";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		for(i=0;i<3;i+=1){
			rdms[i] = sin(951753*i+114.514-1919.810)*30;
		}
		ls = noone;
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(get_target_dir()+90,mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time > 1){
		if(instance_exists(ls)){
			ls.x = get_gun_pos()[0];
			ls.y = get_gun_pos()[1];
			ls.image_angle = mark.gun_angle-90;
		}
	}
	if(attack_time = 100||attack_time = 240||attack_time = 380||attack_time = 520||attack_time = 660||attack_time = 800){
		mark.GunAttack(0);
		gx = get_gun_pos()[0];
		gy = get_gun_pos()[1];
		for(i=0;i<20;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(gx+lengthdir_x(i*50,mark.gun_angle-90),gy+lengthdir_y(i*50,mark.gun_angle-90),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,20);
				blt.x += lengthdir_x(20,j*120+i*30);
				blt.y += lengthdir_y(20,j*120+i*30);
				blt.direction = j*120+i*30;
				Anim_Create(blt,"speed",0,0,0,10,20,60+i*2);
			}
		}
	}
	if(attack_time = 140){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(rdms[0],mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time = 280){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(get_target_dir()+90,mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time = 420){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(rdms[1],mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time = 560){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(get_target_dir()+90,mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time = 700){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.gun_angle,angle_difference(rdms[2],mark.gun_angle),60);
		ls = MakeEnemyLaser(2,get_gun_pos()[0],get_gun_pos()[1],1,mark.gun_angle-90,60,30);
	}
	if(attack_time = 850){
		mark.SetMoveEnabled(true);
		mark.SetIdle();
		end_attack();
	}
}

attack_5 = function(){//反弹红蓝
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_5";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		rdmpx = 320;
		rdmpy = 320;
		Anim_Create(mark,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.x,rdmpx-mark.x,20);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.y,rdmpy-mark.y,20);
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.ring_angle,60,20);
	}
	if(attack_time = 30||attack_time = 150||attack_time = 270||attack_time = 390){
		Anim_Create(mark,"ring_angle",0,0,mark.ring_angle,60,30);
		Anim_Create(mark,"corner_angle",0,0,mark.corner_angle,-60,30);
	}
	if(attack_time = 120||attack_time = 240||attack_time = 360){
		rdmpx = 360+sin(attack_time*1282+91)*40;
		rdmpy = 335+cos(attack_time*85622+52)*15;
		Anim_Create(mark,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.x,rdmpx-mark.x,30);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.y,rdmpy-mark.y,30);
	}
	if(attack_time >= 30&&attack_time <= 60){
		if(attack_time mod 4 = 0){
			for(i=0;i<3;i+=1){
				dd = mark.ring_angle - 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
				blt.image_index = 1;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,100-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
				dd = mark.corner_angle + 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,100-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
	if(attack_time >= 150&&attack_time <= 180){
		if(attack_time mod 4 = 0){
			for(i=0;i<3;i+=1){
				dd = mark.ring_angle - 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
				blt.image_index = 1;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,220-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
				dd = mark.corner_angle + 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,220-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
	if(attack_time >= 270&&attack_time <= 300){
		if(attack_time mod 4 = 0){
			for(i=0;i<3;i+=1){
				dd = mark.ring_angle - 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
				blt.image_index = 1;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,340-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
				dd = mark.corner_angle + 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,340-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
	if(attack_time >= 390&&attack_time <= 420){
		if(attack_time mod 4 = 0){
			for(i=0;i<3;i+=1){
				dd = mark.ring_angle - 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(230,dd),y+lengthdir_y(230,dd),bullet_enemy_normal);
				blt.image_index = 1;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,460-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
				dd = mark.corner_angle + 30 + i*120;
				blt = MakeEnemyBullet(x+lengthdir_x(300,dd),y+lengthdir_y(300,dd),bullet_enemy_normal);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
				blt.direction = dd;
				Anim_Create(blt,"speed",0,0,0,8,30,460-attack_time);
				with(blt){
					bounced = 0;
					custom_function = function(){
						if(bounced < 1){
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
	if(attack_time = 520){
		mark.SetMoveEnabled(true);
		mark.SetIdle();
		end_attack();
	}
}
	
attack_6 = function(){//旋转激光加反弹红弹
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_6";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		Anim_Create(mark,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.x,room_width/2-mark.x,30);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.y,room_height/2-mark.y,30);
		Anim_Create(mark,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,120,30);
		Anim_Create(mark,"corner_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-120,30);
		ring_rot = 0;
		corner_rot = 0;
	}
	if(attack_time = 30){
		for(i=0;i<6;i+=1){
			if(i mod 2 = 0)dd = mark.ring_angle - 30 + i*120;
			if(i mod 2 = 1)dd = mark.gun_angle + 30 + i*120;
			ls[i] = MakeEnemyLaser(2,x+lengthdir_x(230+(i mod 2)*20,dd),y+lengthdir_y(230+(i mod 2)*20,dd),1+(i mod 2),-90,90,-1);
			ls[i].wave_effect = true;
		}
	}
	if(attack_time = 120){
		Anim_Create(id,"ring_rot",0,0,0,1,60);
		Anim_Create(id,"corner_rot",0,0,0,1,60);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.gun_angle,-45,60);
	}
	if(attack_time >= 30){
		for(i=0;i<6;i+=1){
			if(instance_exists(ls[i])){
				if(i mod 2 = 0)dd = mark.ring_angle + 30 + i*120;
				if(i mod 2 = 1)dd = mark.corner_angle - 30 + i*120;
				ls[i].x = x+lengthdir_x(230+(i mod 2)*20,dd);
				ls[i].y = y+lengthdir_y(230+(i mod 2)*20,dd);
				ls[i].image_angle = dd;
			}
		}
			
		if(attack_time > 130){
			mark.ring_angle += ring_rot;
			mark.corner_angle += corner_rot;
		}
	}
	if(attack_time = 180||attack_time = 300||attack_time = 420||attack_time = 540){
		mark.GunAttack(1);
		gp = get_gun_pos();
		for(i=0;i<10;i+=1){
			blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_red_tracking);
			blt.direction = mark.gun_angle+30*4-30*i-90;
			blt.speed = 7;
			blt.depth -= 10;
			with(blt){
				bounced = 0;
				custom_function = function(){
					if(bounced < 2){
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
	if(attack_time = 200||attack_time = 320||attack_time = 440||attack_time = 560){
		mark.GunAttack(1);
		gp = get_gun_pos();
		for(i=0;i<5;i+=1){
			blt = MakeEnemyBullet(gp[0],gp[1],bullet_enemy_red_tracking);
			blt.direction = mark.gun_angle+30*2-30*i-90;
			blt.speed = 5.5;
			blt.depth -= 10;
			with(blt){
				bounced = 0;
				custom_function = function(){
					if(bounced < 1){
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
	if(attack_time = 220){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.gun_angle,90,60);
	}
	if(attack_time = 340){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.gun_angle,90,60);
	}
	if(attack_time = 460){
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.gun_angle,90,60);
	}
	if(attack_time = 600){
		Anim_Create(id,"ring_rot",0,0,ring_rot,-ring_rot,30);
		Anim_Create(id,"corner_rot",0,0,corner_rot,-corner_rot,30);
		for(i=0;i<6;i+=1){
			ls[i].duration = 30;
		}
	}
	if(attack_time = 630){
		Anim_Create(mark,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.x,room_width/2-mark.x,30);
		Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,mark.y,room_height/2-mark.y,30);
	}
	if(attack_time = 660){
		mark.SetMoveEnabled(true);
		mark.SetIdle();
		end_attack();
	}
}

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,30)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,30)
a4 = create_attack(4,attack_4,30)
a5 = create_attack(5,attack_5,30)
a6 = create_attack(6,attack_6,30)
a7 = create_attack(7,attack_0,30,,1)
a8 = create_attack(8,attack_1,30,,1)

fixed_sequence = [a0,a1,a2,a3,a4,a7,a2,a6,a5]
random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8]

since_a6 = 5;

_end_attack_orig = end_attack;
end_attack = function(){
	if(current_attack = a3){
		with(bullet_enemy_normal){
			if(variable_instance_exists(id,"mm")&&mm = 1){
				if(x < room_width/2){
					Anim_Create(id,"hspeed",0,0,0,-8,40);
				}
				else{
					Anim_Create(id,"hspeed",0,0,0,8,40);
				}
			}
		}
		if(mark.GetFrozen() > 0){
			Anim_Create(id,"top_red_thickness",ANIM_TWEEN.QUAD,ANIM_EASE.IN,100,-100,20);
		}
	}
	if(current_attack != undefined){
		if(current_attack.id_num = 5){
			since_a6 = 0;
		}
		else{
			since_a6 += 1;
		}
	}
	_end_attack_orig();
}

_get_next_attack_orig = get_next_attack;
get_next_attack = function(){
	if(since_a6 < 5){
		var _sp = random_pool, _sf = fixed_sequence;
		var _np = [], _nf = [];
		for(var _i = 0; _i < array_length(_sp); _i += 1){
			if(_sp[_i].id_num != 5)array_push(_np,_sp[_i]);
		}
		for(var _i = 0; _i < array_length(_sf); _i += 1){
			if(_sf[_i].id_num != 5)array_push(_nf,_sf[_i]);
		}
		random_pool = _np;
		fixed_sequence = _nf;
		_get_next_attack_orig();
		random_pool = _sp;
		fixed_sequence = _sf;
	}
	else{
		_get_next_attack_orig();
	}
}