event_inherited();

attack_0 = function(){//水蓝
	if(attack_time = 1){
		aa = 0;
		ea = 0;
		rot = 1.5;
		a0d = 630;
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				ix = -1100+i*150;
				iy = -1000+j*150;
				if!(point_in_rectangle(mouse_x,mouse_y,ix-75,iy-75,ix+75,iy+75)){
					bb[i][j] = MakeEnemyBullet(ix,iy,bullet_enemy_normal);
					bb[i][j].sprite_index = spr_pixel2x;
					bb[i][j].image_xscale = 70;
					bb[i][j].image_yscale = 10;
					bb[i][j].image_alpha = 0;
					bb[i][j].direction = -90;
					bb[i][j].speed = 3;
					bb[i][j].mask_index = -1;
					bb[i][j].auto_destroy = false;
				}
				else{
					ei = i;
					ej = j;
				}
				Anim_Create(id,"aa",0,0,0,1,40);
			}
		}
		
	}
	if(attack_time > 1){
		if(bb[0][0].x > -1100+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x -= 600;
				}
			}
		}
		if(bb[0][0].y > -1000+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y -= 600;
				}
			}
		}
		if(bb[0][0].x < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x += 600;
				}
			}
		}
		if(bb[0][0].y < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y += 600;
				}
			}
		}
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))bb[i][j].image_angle -= rot;
				if(instance_exists(bb[i][j]))dist = point_distance(bb[i][j].x,bb[i][j].y,mouse_x,mouse_y);
				ba = 1;
				if(dist < 200)ba = 1;
				if(dist >= 200&&dist < 300)ba = 1-(dist-200)/100;
				if(dist >= 300)ba = 0;
				if(instance_exists(bb[i][j])){
					bb[i][j].image_alpha = ba*aa;
					if(i = ei&&j = ej){
						bb[i][j].image_alpha =ba*aa*ea;
					}
				}
			}
		}
	}
	if(attack_time = 40){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				with(bb[i][j])mask_index = sprite_index;
			}
		}
	}
	if(attack_time mod 120 = 0&&attack_time<a0d-90){
		if(!instance_exists(bb[ei][ej])){
			bb[ei][ej] = MakeEnemyBullet(bb[ei-1][ej].x+150,bb[ei-1][ej].y,bullet_enemy_normal);
			bb[ei][ej].sprite_index = spr_pixel2x;
			bb[ei][ej].image_xscale = 70;
			bb[ei][ej].image_yscale = 10;
			bb[ei][ej].image_alpha = 0;
			bb[ei][ej].speed = 3;
			bb[ei][ej].direction = bb[0][0].direction;
			bb[ei][ej].auto_destroy = false;
			Anim_Create(id,"ea",0,0,0,1,40);
		}
		rdm = 45*(sign(sin(attack_time*159)*753));
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))Anim_Create(bb[i][j],"direction",0,0,bb[i][j].direction,rdm,80);
			}
		}
	}
	if(attack_time = a0d-90){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				bb[i][j].mask_index = -1;
				Anim_Create(bb[i][j],"speed",0,0,bb[i][j].speed,-bb[i][j].speed,60);
				Anim_Create(id,"rot",0,0,rot,-rot,60);
				Anim_Create(id,"aa",0,0,1,-1,60,30);
			}
		}
	}
	if(attack_time = a0d){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j])){
					bb[i][j].destroy_type = 3;
					instance_destroy(bb[i][j]);
				}
			}
		}
		end_attack();
	}
}
	
attack_1 = function(){//莲华螺旋(三段式:旋涡-绽放-绝)
	live_name = "emitter_enemy_test:attack_1";
	live;

	a1_pos = Player_GetPos();
	px = a1_pos[0];
	py = a1_pos[1];

	if(attack_time = 1){
		a1_spin = 1;       //旋涡旋转方向
		a1_rate = 2;       //旋涡发射间隔
		a1_arms = 2;       //旋涡臂数
		a1_spd = 3.6;      //旋涡末速
		a1_waves = [];     //种子激活队列 {t,list,mode,done}
		//封位环:绕目标悬停一圈,激活后整环狙向目标当前位置收网
		a1_spawn_ring = function(_cx,_cy,_count,_radius,_delay){
			var _list = [];
			for(m=0;m<_count;m+=1){
				ang = m*360/_count-90;
				blt = MakeEnemyBullet(_cx+lengthdir_x(_radius,ang),_cy+lengthdir_y(_radius,ang),bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_xscale = 1.15;
				blt.image_yscale = 1.15;
				blt.speed = 0;
				array_push(_list,blt);
			}
			array_push(a1_waves,{t:attack_time+_delay,list:_list,mode:0,done:false});
		}
		//黄金角绽放盘:种子悬停显形,激活后向外奇偶双旋炸开
		a1_spawn_bloom = function(_cx,_cy,_count,_size,_delay){
			var _list = [];
			for(m=0;m<_count;m+=1){
				ang = m*137.508;
				blt = MakeEnemyBullet(_cx+lengthdir_x(_size*sqrt((m+0.5)/_count),ang),_cy+lengthdir_y(_size*sqrt((m+0.5)/_count),ang),bullet_enemy_normal,spr_bullet_enemy_normal_3);
				blt.image_xscale = 0.2;
				blt.image_yscale = 0.2;
				blt.speed = 0;
				blt.bloom_dir = ang;
				Anim_Create(blt,"image_xscale",0,0,0.2,1.05,30);
				Anim_Create(blt,"image_yscale",0,0,0.2,1.05,30);
				array_push(_list,blt);
			}
			array_push(a1_waves,{t:attack_time+_delay,list:_list,mode:1,done:false});
		}
	}

	//=== 主体:旋涡弹幕(140反向,280四臂加速) ===
	if(attack_time >= 10&&attack_time < 370){
		if(attack_time mod a1_rate = 0){
			for(i=0;i<a1_arms;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				a1_dir = a1_spin*attack_time*7+i*360/a1_arms+random_range(-2,2);
				blt.direction = a1_dir;
				blt.image_angle = a1_dir;
				blt.speed = 0.4;
				Anim_Create(blt,"speed",0,0,0.4,a1_spd-0.4,50);
				Anim_Create(blt,"direction",0,0,a1_dir,a1_spin*16,50);
				Anim_Create(blt,"image_angle",0,0,a1_dir,a1_spin*16,50);
			}
		}
	}

	//=== 时间轴 ===
	if(attack_time = 30)a1_spawn_ring(px,py,16,130,55);
	if(attack_time = 85)a1_spawn_ring(px,py,16,130,55);
	if(attack_time = 140){//二段「绽」:旋涡反向
		a1_spin = -a1_spin;
	}
	if(attack_time = 155){
		a1_bd = point_direction(px,py,room_width/2,room_height/2)+random_range(-60,60);
		a1_br = random_range(170,240);
		a1_bx = clamp(px+lengthdir_x(a1_br,a1_bd),120,room_width-120);
		a1_by = clamp(py+lengthdir_y(a1_br,a1_bd),120,room_height-120);
		a1_spawn_bloom(a1_bx,a1_by,36,74,45);
	}
	if(attack_time = 200)a1_spawn_ring(px,py,16,140,55);
	if(attack_time = 215){
		a1_bd = point_direction(px,py,room_width/2,room_height/2)+random_range(-60,60);
		a1_br = random_range(170,240);
		a1_bx = clamp(px+lengthdir_x(a1_br,a1_bd),120,room_width-120);
		a1_by = clamp(py+lengthdir_y(a1_br,a1_bd),120,room_height-120);
		a1_spawn_bloom(a1_bx,a1_by,36,74,45);
	}
	if(attack_time = 280){//三段「绝」:四臂高速旋涡
		a1_arms = 4;
		a1_spd = 4.8;
	}
	if(attack_time >= 290&&attack_time <= 350&&attack_time mod 30 = 20){//侧翼三连狙(左右夹击)
		a1_sy = 320+(attack_time-290)*6;
		for(k=0;k<2;k+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(k*room_width,a1_sy,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				a1_dir = point_direction(blt.x,blt.y,px,py)+(j-1)*16;
				blt.direction = a1_dir;
				blt.image_angle = a1_dir;
				blt.speed = 5;
				Anim_Create(blt,"speed",0,0,5,4.5,30,6);
			}
		}
	}
	if(attack_time = 305){//大绽放
		a1_bd = point_direction(px,py,room_width/2,room_height/2)+random_range(-60,60);
		a1_br = random_range(200,260);
		a1_bx = clamp(px+lengthdir_x(a1_br,a1_bd),130,room_width-130);
		a1_by = clamp(py+lengthdir_y(a1_br,a1_bd),130,room_height-130);
		a1_spawn_bloom(a1_bx,a1_by,52,96,45);
	}

	//=== 种子激活 ===
	for(wi=0;wi<array_length(a1_waves);wi+=1){
		wv = a1_waves[wi];
		if(wv.done)continue;
		if(attack_time < wv.t)continue;
		wv.done = true;
		for(n=0;n<array_length(wv.list);n+=1){
			sd = wv.list[n];
			if(!instance_exists(sd))continue;
			if(wv.mode = 0){//环狙:扇形收网
				sd.direction = point_direction(sd.x,sd.y,px,py)+(n-array_length(wv.list)/2)*2.2;
				sd.image_angle = sd.direction;
				Anim_Create(sd,"speed",0,0,0,4.4,16,10);
			}
			else{//绽放:奇偶双旋
				Anim_Create(sd,"speed",0,0,0,4.6,25,6);
				sw = 24;
				if((n mod 2) = 1)sw = -24;
				sd.image_angle = sd.bloom_dir;
				Anim_Create(sd,"direction",0,0,sd.bloom_dir,sw,55,6);
				Anim_Create(sd,"image_angle",0,0,sd.bloom_dir,sw,55,6);
			}
		}
	}

	//=== 收尾:子弹正常飞离,出屏后自动回收 ===
	if(attack_time = 400)end_attack();
}
	
attack_2 = function(){
	live_name = "emitter_enemy_test:attack_2";
	live;
	
}

var a0 = create_attack(0,attack_0,30);
var a1 = create_attack(0,attack_1,30);
var a2 = create_attack(0,attack_2,30);

fixed_sequence = [a2];
//random_pool = [a1]//循环测试用