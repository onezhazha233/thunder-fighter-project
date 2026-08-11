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
		bl = MakeEnemyLaser(2,x,y-250,1,90,60,-1);
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

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,30)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,30)
/*a4 = create_attack(4,attack_4,30)*/

//fixed_sequence = []
//random_pool = [a0,a1,a2,a3]

fixed_sequence = [a3]

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
			Anim_Create(mark,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,mark.y,-20,20);
		}
	}
	_end_attack_orig();
}


//enabled = true