//live;
event_inherited();

attack_0 = function(){//四排间隔下落加散射
	live_name = "emitter_boss_hellhound:attack_0";
	live;
	if(attack_time = 1){
		for(i=0;i<24;i+=1){
			blt = MakeEnemyBullet(-30,300,bullet_enemy_normal);
			blt.image_xscale = 4;
			blt.image_yscale = 4;
			if(i mod 4 < 2)blt.image_index = 1;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,15+i*30-blt.x,40);
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"vspeed",0,0,0,30,60,(i mod 8)*3+150);
			Anim_Create(blt,"hspeed",0,0,0,5-(i mod 4 < 2)*2,30,(i mod 8)*3+150);
		}
	}
	if(attack_time = 10){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_0);
		for(i=0;i<20;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x-140,y+150,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = i*18-90;
				blt.direction = blt.image_angle;
				blt.speed= 0.2;
				Anim_Create(blt,"speed",0,0,0.2,10-(i mod 4)+j*2,10,200);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				blt = MakeEnemyBullet(x+140,y+150,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = i*18-90;
				blt.direction = blt.image_angle;
				blt.speed= 0.2;
				Anim_Create(blt,"speed",0,0,0.2,10-(i mod 4)+j*2,10,200);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
			}
		}
	}
	if(attack_time = 20){
		for(i=0;i<24;i+=1){
			blt = MakeEnemyBullet(750,340,bullet_enemy_normal);
			blt.image_xscale = 4;
			blt.image_yscale = 4;
			if(i mod 4 < 2)blt.image_index = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,720-(15+i*30)-blt.x,40);
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"vspeed",0,0,0,30,60,(i mod 8)*3+110);
			Anim_Create(blt,"hspeed",0,0,0,-5+(i mod 4 < 2)*2,30,(i mod 8)*3+110);
		}
	}
	if(attack_time = 40){
		for(i=0;i<24;i+=1){
			blt = MakeEnemyBullet(-30,380,bullet_enemy_normal);
			blt.image_xscale = 4;
			blt.image_yscale = 4;
			if(i mod 4 < 2)blt.image_index = 1;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,15+i*30-blt.x,40);
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"vspeed",0,0,0,30,60,(i mod 8)*3+70);
			Anim_Create(blt,"hspeed",0,0,0,5-(i mod 4 < 2)*2,30,(i mod 8)*3+70);
		}
	}
	if(attack_time = 60){
		for(i=0;i<24;i+=1){
			blt = MakeEnemyBullet(750,420,bullet_enemy_normal);
			blt.image_xscale = 4;
			blt.image_yscale = 4;
			if(i mod 4 < 2)blt.image_index = 2;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,720-(15+i*30)-blt.x,40);
			Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,4,-2.5,30);
			Anim_Create(blt,"vspeed",0,0,0,30,60,(i mod 8)*3+30);
			Anim_Create(blt,"hspeed",0,0,0,-5+(i mod 4 < 2)*2,30,(i mod 8)*3+30);
		}
	}
	if(attack_time = 70){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_0);
		for(i=0;i<20;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x-140,y+150,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = i*18-90;
				blt.direction = blt.image_angle;
				blt.speed= 0.2;
				blt.image_index = 1;
				Anim_Create(blt,"speed",0,0,0.2,10-(i mod 4)+j*2,10,170);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				blt = MakeEnemyBullet(x+140,y+150,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				blt.image_angle = i*18-90;
				blt.direction = blt.image_angle;
				blt.speed= 0.2;
				blt.image_index = 1;
				Anim_Create(blt,"speed",0,0,0.2,10-(i mod 4)+j*2,10,170);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,30);
			}
		}
	}
	if(attack_time = 260){
		end_attack();
	}
}
	
attack_1 = function(){//倒五角星加狙
	live_name = "emitter_boss_hellhound:attack_1";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		star_size = 200;
		point_count = 15;
		spawn_interval = 1;

		pos_list = [];
		cx = x; cy = y;

		var add_line = function(list, x1, y1, x2, y2, group_a, group_b) {
			for(var i = 0; i < point_count; i++) {
				var t = i / point_count;
				var px = x1 + (x2 - x1) * t;
				var py = y1 + (y2 - y1) * t;
				var group = (t < 0.5) ? group_a : group_b;
				array_push(list, {px: px, py: py, group: group});
			}
		};

		var v1 = {x:cx + lengthdir_x(star_size, 270), y:cy + lengthdir_y(star_size, 270)};
		var v2 = {x:cx + lengthdir_x(star_size, 342), y:cy + lengthdir_y(star_size, 342)};
		var v3 = {x:cx + lengthdir_x(star_size, 54), y:cy + lengthdir_y(star_size, 54)};
		var v4 = {x:cx + lengthdir_x(star_size, 126), y:cy + lengthdir_y(star_size, 126)};
		var v5 = {x:cx + lengthdir_x(star_size, 198), y:cy + lengthdir_y(star_size, 198)};

		add_line(pos_list, v1.x, v1.y, v3.x, v3.y, 0, 2);
		add_line(pos_list, v3.x, v3.y, v5.x, v5.y, 2, 4);
		add_line(pos_list, v5.x, v5.y, v2.x, v2.y, 4, 1);
		add_line(pos_list, v2.x, v2.y, v4.x, v4.y, 1, 3);
		add_line(pos_list, v4.x, v4.y, v1.x, v1.y, 3, 0);

		all_bullets = array_create(array_length(pos_list), noone);
		build_len = array_length(pos_list);
		triangle_dir = [270, 342, 54, 126, 198];
	}

	if(attack_time >= 10 && attack_time < 10 + build_len * spawn_interval){
		var idx = floor((attack_time - 10) / spawn_interval);
		if((attack_time - 10) mod spawn_interval == 0 && idx < array_length(pos_list)){
			var p = pos_list[idx];
			var inst = MakeEnemyBullet(p.px, p.py, bullet_enemy_normal);
			with(inst){
				self.group = p.group;
				speed = 0;
				bounced = 0;
				custom_function = function(){
					if(bounced < 3){
						if(x <= 0 || x >= room_width){
							if(x <= 0)x = abs(x);
							if(x >= room_width)x = room_width-(x-room_width);
							hspeed *= -1;
							bounced += 1;
						}
						if(y <= 0 || y >= room_height){
							if(y <= 0)y = abs(y);
							if(y >= room_height)y = room_height-(y-room_height);
							vspeed *= -1;
							bounced += 1;
						}
					}
				}
			}
			all_bullets[idx] = inst;
		}
	}

	if(attack_time = 85){
		mark.SetMoveEnabled(true);
		for(var i = 0; i < array_length(all_bullets); i++){
			if(instance_exists(all_bullets[i])){
				var inst = all_bullets[i];
				var group = inst.group;
				inst.direction = triangle_dir[group];
				Anim_Create(inst, "speed", 0, 0, 0, 12, 20, 0);
				Anim_Create(inst, "image_xscale", 0, 0, 1, 1, 20, 0);
				Anim_Create(inst, "image_yscale", 0, 0, 1, 1, 20, 0);
			}
		}
	}

	if(attack_time = 60){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_1);
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
	}
	if(attack_time >= 60&&attack_time <= 240){
		if(attack_time mod 10 = 0){
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x-96,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.image_angle = point_direction(blt.x,blt.y,px,py)-20+20*i;
				blt.direction = blt.image_angle;
				blt.speed = 8;
				blt = MakeEnemyBullet(x+96,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.image_angle = point_direction(blt.x,blt.y,px,py)-20+20*i;
				blt.direction = blt.image_angle;
				blt.speed = 8;
			}
		}
		if(attack_time mod 40 = 0){
			px = mouse_x;
			py = mouse_y;
			if(Player_IsEnabled()){
				px = player.x;
				py = player.y;
			}
		}
	}
	if(attack_time = 250){
		mark.SetIdle();
	}
	if(attack_time = 300){
		end_attack();
	}
}
	
attack_2 = function(){//旋转激光
	live_name = "emitter_boss_hellhound:attack_2";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		a0 = MakeEnemyLaser(1,x-140,y+150,1,-90,60,120);
		b0 = MakeEnemyLaser(1,x-100,y+130,1,-90,60,120);
		c0 = MakeEnemyLaser(1,x-32,y+125,1,-90,60,120);
		a1 = MakeEnemyLaser(1,x+140,y+150,1,-90,60,120);
		b1 = MakeEnemyLaser(1,x+100,y+130,1,-90,60,120);
		c1 = MakeEnemyLaser(1,x+32,y+125,1,-90,60,120);
	}
	if(attack_time = 90){
		Anim_Create(a0,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90,40,60);
		Anim_Create(c0,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90,-40,60);
		Anim_Create(a1,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90,-40,60);
		Anim_Create(c1,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90,40,60);
	}
	if(attack_time = 210){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_3 = function(){//四边狙加随机散射
	live_name = "emitter_boss_hellhound:attack_3";
	live;
	if(attack_time > 10&&attack_time < 250){
		if(attack_time mod 5 = 0){
			for(i=0;i<4;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.image_angle = sin(attack_time*951+753+i*951)*360;
				blt.direction = blt.image_angle;
				blt.speed = 3;
				Anim_Create(blt,"speed",0,0,blt.speed,5,20,50);
			}
		}
	}
	if(attack_time = 1){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<7;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90),py+lengthdir_y(150,i*90),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-3)*20,i*90+90),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-3)*20,i*90+90),30,30);
				blt.direction = i*90;
				Anim_Create(blt,"speed",0,0,0,-10,20,90+abs(j-3)*5);
			}
		}
	}
	if(attack_time = 50){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<7;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90+45),py+lengthdir_y(150,i*90+45),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				blt.image_index = 2;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-3)*20,i*90+90+45),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-3)*20,i*90+90+45),30,30);
				blt.direction = i*90+45;
				Anim_Create(blt,"speed",0,0,0,-10,20,90+abs(j-3)*5);
			}
		}
	}
	if(attack_time = 100){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<7;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90),py+lengthdir_y(150,i*90),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-3)*20,i*90+90),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-3)*20,i*90+90),30,30);
				blt.direction = i*90;
				Anim_Create(blt,"speed",0,0,0,-10,20,90+abs(j-3)*5);
			}
		}
	}
	if(attack_time = 150){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<7;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90+45),py+lengthdir_y(150,i*90+45),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				blt.image_index = 2;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-3)*20,i*90+90+45),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-3)*20,i*90+90+45),30,30);
				blt.direction = i*90+45;
				Anim_Create(blt,"speed",0,0,0,-10,20,90+abs(j-3)*5);
			}
		}
	}
	if(attack_time = 200){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<9;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90),py+lengthdir_y(150,i*90),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-4)*20,i*90+90),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-4)*20,i*90+90),30,30);
				blt.direction = i*90;
				Anim_Create(blt,"speed",0,0,0,-10,20,60+abs(j-4)*5);
			}
		}
	}
	if(attack_time = 250){
		px = mouse_x;
		py = mouse_y;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		for(i=0;i<4;i+=1){
			for(j=0;j<9;j+=1){
				blt = MakeEnemyBullet(px+lengthdir_x(150,i*90+45),py+lengthdir_y(150,i*90+45),bullet_enemy_normal);
				blt.image_xscale = 0;
				blt.image_yscale = 0;
				blt.image_index = 2;
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,lengthdir_x((j-4)*20,i*90+90+45),30,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,lengthdir_y((j-4)*20,i*90+90+45),30,30);
				blt.direction = i*90+45;
				Anim_Create(blt,"speed",0,0,0,-10,20,60+abs(j-4)*5);
			}
		}
	}
	if(attack_time = 380){
		end_attack();
	}
}
	
attack_4 = function(){//五向旋转散射加短激光下落
	live_name = "emitter_boss_hellhound:attack_4";
	live;
	if(attack_time = 1){
		mark.move_duration = [60,90];
	}
	if(attack_time > 1&&attack_time < 600){
		if(attack_time mod 5 = 0){
			for(i=0;i<5;i+=1){
				blt = MakeEnemyBullet(x-32,y+125,bullet_enemy_normal);
				blt.direction = attack_time*2 + i*72-90;
				blt.speed = 8;
				if(attack_time mod 30 < 15)blt.image_index = 3;
				blt = MakeEnemyBullet(x+32,y+125,bullet_enemy_normal);
				blt.direction = -attack_time*2 + i*72-90;
				blt.speed = 8;
				if(attack_time mod 30 < 15)blt.image_index = 3;
			}
		}
		if(attack_time mod 40 = 0&&attack_time < 560){
			xx = 360 + sin(attack_time*114514+27254 mod 256 + 654)*250;
			blt = MakeEnemyBullet(x,y,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,xx-x,40);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,100+sin(attack_time*3525+2856)*50-blt.y,40);
			Anim_Create(blt,"vspeed",0,0,0,10,40,40);
			Anim_Create(blt,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,100,40);
		}
	}
	if(attack_time = 650){
		mark.SetIdle();
		end_attack();
	}
}
	
attack_5 = function(){//短激光阵列
	live_name = "emitter_boss_hellhound:attack_5";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_2);
		mark.SetMoveEnabled(false);
	}
	if(attack_time >= 1&&attack_time <= 81){
		if(attack_time mod 10 = 1){
			dd = (attack_time-1) div 10;
			blt = MakeEnemyBullet(x-35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,-200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-45+dd*11.25,30,90);
			blt.direction = -45+dd*11.25;
			Anim_Create(blt,"speed",0,0,0,10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
			blt = MakeEnemyBullet(x+35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45-dd*11.25,30,90);
			blt.direction = 45-dd*11.25;
			Anim_Create(blt,"speed",0,0,0,-10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
		}
	}
	if(attack_time = 80){
		with(mark){
			Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,random_range(move_range[0],move_range[2])-x,20);
			Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,random_range(move_range[1],move_range[3])-y,20);
		}
	}
	if(attack_time = 90){
		mark.SetIdle();
	}
	if(attack_time = 100){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_2);
	}
	if(attack_time >= 101&&attack_time <= 181){
		if(attack_time mod 10 = 1){
			dd = (attack_time-101) div 10;
			blt = MakeEnemyBullet(x-35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,-200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-45+dd*11.25,30,90);
			blt.direction = -45+dd*11.25;
			Anim_Create(blt,"speed",0,0,0,10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
			blt = MakeEnemyBullet(x+35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45-dd*11.25,30,90);
			blt.direction = 45-dd*11.25;
			Anim_Create(blt,"speed",0,0,0,-10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
		}
	}
	if(attack_time = 180){
		with(mark){
			Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,random_range(move_range[0],move_range[2])-x,20);
			Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,random_range(move_range[1],move_range[3])-y,20);
		}
	}
	if(attack_time = 190){
		mark.SetIdle();
	}
	if(attack_time = 200){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_2);
	}
	if(attack_time >= 201&&attack_time <= 281){
		if(attack_time mod 10 = 5){
			dd = (attack_time-201) div 10;
			blt = MakeEnemyBullet(x-35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,-200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-45+dd*11.25,30,90);
			blt.direction = -45+dd*11.25;
			Anim_Create(blt,"speed",0,0,0,10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
			blt = MakeEnemyBullet(x+35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45-dd*11.25,30,90);
			blt.direction = 45-dd*11.25;
			Anim_Create(blt,"speed",0,0,0,-10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
		}
	}
	if(attack_time = 280){
		with(mark){
			Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,random_range(move_range[0],move_range[2])-x,20);
			Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,random_range(move_range[1],move_range[3])-y,20);
		}
	}
	if(attack_time = 290){
		mark.SetIdle();
	}
	if(attack_time = 300){
		mark.SetSequence(seq_enemy_boss_mini_og2_attack_2);
	}
	if(attack_time >= 301&&attack_time <= 381){
		if(attack_time mod 10 = 5){
			dd = (attack_time-301) div 10;
			blt = MakeEnemyBullet(x-35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,-200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-45+dd*11.25,30,90);
			blt.direction = -45+dd*11.25;
			Anim_Create(blt,"speed",0,0,0,10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
			blt = MakeEnemyBullet(x+35,y+115,bullet_enemy_short_laser);
			blt.length = 0;
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,(9-dd)*60,60);
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.x,200,30,90);
			Anim_Create(blt,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,45-dd*11.25,30,90);
			blt.direction = 45-dd*11.25;
			Anim_Create(blt,"speed",0,0,0,-10,40,160-dd*5);
			Anim_Create(blt,"length",0,0,0,80,20,160-dd*5);
		}
	}
	if(attack_time = 400){
		mark.SetIdle();
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_6 = function(){//倒v下落加短激光网
	live_name = "emitter_boss_hellhound:attack_6";
	live;
	if(attack_time = 1){
		bb = 0;
		ll = 0;
		sl = [];
	}
	if(attack_time >= 1&&attack_time <= 600){
		if(attack_time mod 30 = 1){
			if(bb = 0){
				for(i=0;i<7;i+=1){
					xx = x - 240 - 3*40+40*i;
					yy = y - 200;
					blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
					blt.image_xscale = 0;
					blt.image_yscale = 0;
					Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,xx-blt.x,30);
					Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,yy-blt.y,30);
					Anim_Create(blt,"vspeed",0,0,0,15+abs(i-3),40,30);
					xx = x + 200 - 3*40+40*i;
					yy = y - 200;
					blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
					blt.image_xscale = 0;
					blt.image_yscale = 0;
					Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,xx-blt.x,30);
					Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,yy-blt.y,30);
					Anim_Create(blt,"vspeed",0,0,0,15+abs(i-3),40,30);
				}
			}
			else{
				for(i=0;i<9;i+=1){
					xx = x - 4*40+40*i;
					yy = y - 200;
					blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
					blt.image_xscale = 0;
					blt.image_yscale = 0;
					Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,30);
					Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,xx-blt.x,30);
					Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,yy-blt.y,30);
					Anim_Create(blt,"vspeed",0,0,0,15+abs(i-4),40,30);
				}
			}
			bb = !bb;
		}
		if(attack_time mod 60 = 0){
			px = mouse_x;
			py = mouse_y;
			if(Player_IsEnabled()){
				px = player.x;
				py = player.y;
			}
			if(ll = 0){
				px = 10;
				blt = MakeEnemyBullet(px-40,py,bullet_enemy_short_laser);
				blt.length = 0;
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,40,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,room_width/2-blt.x,60,700-attack_time);
				Anim_Create(blt,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.length,room_width/2-blt.left,60,700-attack_time);
				Anim_Create(blt,"image_alpha",0,0,1,-1,30,700-attack_time+60);
				blt.duration = 700-attack_time+90;
				array_push(sl,blt);
				px = room_width-10;
				blt = MakeEnemyBullet(px+40,py,bullet_enemy_short_laser);
				blt.length = 0;
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,-40,30);
				Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.x,room_width/2-blt.x,60,700-attack_time);
				Anim_Create(blt,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.length,room_width/2-blt.left,60,700-attack_time);
				Anim_Create(blt,"image_alpha",0,0,1,-1,30,700-attack_time+60);
				blt.duration = 700-attack_time+90;
				array_push(sl,blt);
			}
			else{
				py = 10;
				blt = MakeEnemyBullet(px,py-10,bullet_enemy_short_laser);
				blt.length = 0;
				blt.image_angle = 90;
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,40,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,room_height/2-blt.y,60,700-attack_time);
				Anim_Create(blt,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.length,room_height/2-blt.left,60,700-attack_time);
				Anim_Create(blt,"image_alpha",0,0,1,-1,30,700-attack_time+60);
				blt.duration = 700-attack_time+90;
				array_push(sl,blt);
				py = room_height-10;
				blt = MakeEnemyBullet(px,py+40,bullet_enemy_short_laser);
				blt.length = 0;
				blt.image_angle = 90;
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,-40,30);
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.y,room_height/2-blt.y,60,700-attack_time);
				Anim_Create(blt,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,blt.length,room_height/2-blt.left,60,700-attack_time);
				Anim_Create(blt,"image_alpha",0,0,1,-1,30,700-attack_time+60);
				array_push(sl,blt);
			}
			ll = !ll;
		}
	}
	if(attack_time = 700){
		sl = [];
		end_attack();
	}
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,40)
a3 = create_attack(2,attack_3,40)
a4 = create_attack(3,attack_4,40)
a5 = create_attack(4,attack_5,40)
a6 = create_attack(5,attack_6,40)

fixed_sequence = [a0,a1,a2,a3,a4,a5,a6]
random_pool = [a0,a1,a2,a3,a4,a5,a6]

_end_attack_orig = end_attack;
end_attack = function(){
	if(current_attack = a6&&attack_time < 700){
		for(i=0;i<array_length(sl);i+=1){
			ls = sl[i];
			if(instance_exists(ls)){
				Anim_Destroy(ls);
				if(ls.image_angle = 0){
					Anim_Create(ls,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,ls.x,room_width/2-ls.x,120);
					Anim_Create(ls,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,ls.length,room_width/2-ls.length,120);
				}
				else{
					Anim_Create(ls,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,ls.y,room_height/2-ls.y,120);
					Anim_Create(ls,"length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,ls.length,room_height/2-ls.length,120);
				}
				Anim_Create(ls,"image_alpha",0,0,1,-1,30,120);
				ls.duration = 150;
			}
		}
		sl = [];
	}
	_end_attack_orig();
}