//live;
event_inherited();

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
	
attack_1 = function(){//反弹红弹
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_1";
	live;
	if(attack_time = 1){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-75,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45,30);
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
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-75,150,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,45,-90,30);
	}
	if(attack_time = 90){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,75,-150,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-45,90,30);
	}
	if(attack_time = 135){
		Anim_Create(mark,"gun_xoff",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-75,150,30);
		Anim_Create(mark,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,45,-90,30);
	}
	if(attack_time = 180){
		mark.SetIdle();
	}
	if(attack_time = 240){
		end_attack();
	}
}
	
attack_2 = function(){
	live_name = "emitter_boss_oblivion_star_ring_p1:attack_2";
	live;
	
	
}

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,30)
a2 = create_attack(2,attack_2,30)
/*a3 = create_attack(3,attack_3,30)
a4 = create_attack(4,attack_4,30)*/

//fixed_sequence = [a0,a1,a2,a0,a3,a4,a0,a5,a6,a0,a8,a9,a10]
//random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10]

fixed_sequence = [a2]


//enabled = true