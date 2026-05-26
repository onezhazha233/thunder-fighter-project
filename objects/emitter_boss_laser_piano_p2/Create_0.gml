//live;
event_inherited();

//enabled = true

attack_0 = function(){//收缩扩散收缩
	live_name = "emitter_laser_piano_p2:attack_0";
	live;
	if(attack_time mod 2 = 1){
		if(attack_time < 12*2){
			Laser(attack_time div 2,100);
			Laser(25-(attack_time div 2),100);
		}
		if(attack_time > 15*2&&attack_time < 25*2){
			Laser(12-(attack_time-15*2) div 2,110);
			Laser(13+(attack_time-15*2) div 2,110);
		}
		if(attack_time > 28*2&&attack_time < 38*2){
			Laser((attack_time-28*2) div 2,120);
			Laser(25-(attack_time-28*2) div 2,120);
		}
	}
	if(attack_time = 80){
		Laser(12,120,15);
		Laser(13,120,15);
	}
	if(attack_time = 240){
		end_attack();
	}
}

attack_1 = function(){//左右交错加齐射
	live_name = "emitter_laser_piano_p2:attack_1";
	live;
	if(attack_time mod 2 = 1){
		if(attack_time < 2*9){
			Laser((attack_time div 2)*3,90);
		}
		if(attack_time > 2*15&&attack_time < 2*24){
			Laser(25-((attack_time-2*15) div 2)*3,90);
		}
	}
	if(attack_time = 100){
		for(i=0;i<5;i+=1){
			Laser(i*3,60,30-i*2);
			if(i < 5)Laser(i*3+1,60,30-i*2);
			Laser(25-i*3,60,30-i*2);
			if(i < 5)Laser(25-i*3-1,60,30-i*2);
		}
	}
	if(attack_time = 210){
		end_attack();
	}
}

attack_2 = function(){//三次狙
	live_name = "emitter_laser_piano_p2:attack_2";
	live;
	if(attack_time = 1){
		p_idx = 12; // 默认值防错
		if(instance_exists(player)){
			px = player.x;
		}
		else{
			px = mouse_x;
		}
		var min_dist = 999999;
		for(var i = 0; i < 26; i++) {
		    var dist = abs(px - laser_pos_x[i]);
		    if (dist < min_dist) {
		        min_dist = dist;
		        p_idx = i;
		    }
		}
		Laser(p_idx,60,30,60);
	}
	if(attack_time mod 2 = 0){
		if(attack_time < 2*12){
			pp = p_idx-(attack_time div 2)*2;
			if(pp >= 0){
				Laser(pp,50);
			}
			pp = p_idx+(attack_time div 2)*2;
			if(pp <= 25){
				Laser(pp,50);
			}
		}
	}
	if(attack_time = 90){
		p_idx = 12;
		if(instance_exists(player)){
			px = player.x;
		}
		else{
			px = mouse_x;
		}
		var min_dist = 999999;
		for (var i = 0; i < 26; i++) {
		    var dist = abs(px - laser_pos_x[i]);
		    if (dist < min_dist) {
		        min_dist = dist;
		        p_idx = i;
		    }
		}
		Laser(p_idx,60,30,60);
	}
	if(attack_time mod 2 = 0&&attack_time > 90){
		if(attack_time < 120+2*12){
			pp = p_idx-((attack_time-90) div 2)*2;
			if(pp >= 0){
				Laser(pp,50);
			}
			pp = p_idx+((attack_time-90) div 2)*2;
			if(pp <= 25){
				Laser(pp,50);
			}
		}
	}
	if(attack_time = 180){
		p_idx = 12;
		if(instance_exists(player)){
			px = player.x;
		}
		else{
			px = mouse_x;
		}
		var min_dist = 999999;
		for (var i = 0; i < 26; i++) {
		    var dist = abs(px - laser_pos_x[i]);
		    if (dist < min_dist) {
		        min_dist = dist;
		        p_idx = i;
		    }
		}
		Laser(p_idx,60,30,60);
	}
	if(attack_time mod 2 = 0&&attack_time > 180){
		if(attack_time < 210+2*12){
			pp = p_idx-((attack_time-180) div 2)*2;
			if(pp >= 0){
				Laser(pp,50);
			}
			pp = p_idx+((attack_time-180) div 2)*2;
			if(pp <= 25){
				Laser(pp,50);
			}
		}
	}
	if(attack_time = 300){
		end_attack();
	}
}

attack_3 = function(){//右左五四三二
	live_name = "emitter_laser_piano_p2:attack_3";
	live;
	if(attack_time >= 0 && attack_time < 24){
		var count = (attack_time-1);
		var round1_idx = get_valid_index(count, [21,22,23,24,25]);
		if(round1_idx < 26){
			Laser(round1_idx,120,1,15);
		}
	}
	else if(attack_time >= 24 && attack_time < 49){
		var count = 25-(attack_time - 23);
		var round2_idx = get_valid_index(count, [5,6,7,8]);
		if(round2_idx >= 0 && round2_idx < 26){
			Laser(round2_idx,130,1,15);
		}
	}
	else if(attack_time >= 49 && attack_time < 72){
		var count = (attack_time - 49);
		var round3_idx = get_valid_index(count, [14,15,16]);
		if(round3_idx < 26){
			Laser(round3_idx,140,1,15);
		}
	}
	else if(attack_time >= 72 && attack_time < 98){
		var count = 25-(attack_time - 72);
		var round4_idx = get_valid_index(count, [12,13]);
		if(round4_idx >= 0 && round4_idx < 26){
			Laser(round4_idx,150,1,15);
		}
	}
	if(attack_time = 280){
		end_attack();
	}
}

attack_4 = function(){//右左五四三二
	live_name = "emitter_laser_piano_p2:attack_4";
	live;
	if(attack_time >= 1 && attack_time <= 23){
		var count = (attack_time-1);
		var round1_idx = get_valid_index(count, [21,22,23,24,25]);
		if(round1_idx < 26){
			Laser(25-round1_idx,120,1,15);
		}
	}
	else if(attack_time >= 24 && attack_time <= 48){
		var count = 25-(attack_time - 23);
		var round2_idx = get_valid_index(count, [5,6,7,8]);
		if(round2_idx >= 0 && round2_idx < 26){
			Laser(25-round2_idx,130,1,15);
		}
	}
	else if(attack_time >= 49 && attack_time <= 71){
		var count = (attack_time - 49);
		var round3_idx = get_valid_index(count, [14,15,16]);
		if(round3_idx < 26){
			Laser(25-round3_idx,140,1,15);
		}
	}
	else if(attack_time >= 72 && attack_time <= 97){
		var count = 25-(attack_time - 72);
		var round4_idx = get_valid_index(count, [12,13]);
		if(round4_idx >= 0 && round4_idx < 26){
			Laser(25-round4_idx,150,1,15);
		}
	}
	if(attack_time = 280){
		end_attack();
	}
}
	
attack_5 = function(){//激光齐射加节点横扫
	live_name = "emitter_laser_piano_p2:attack_5";
	live;
	if(attack_time = 1){
		if!(instance_exists(bullet_enemy_laser_piano_node_0)||instance_exists(bullet_enemy_laser_piano_node_1)){
			MakeEnemyLaser(1,x-315,y+60,2,,120,120);
			MakeEnemyLaser(1,x+315,y+33,2,,120,120);
			MakeEnemyLaser(1,x-243,y+110,1,,120,120);
			MakeEnemyLaser(1,x+243,y+110,1,,120,120);
			MakeEnemyLaser(2,x-184,y+200,2,,120,120);
			MakeEnemyLaser(2,x+184,y+200,2,,120,120);
			MakeEnemyLaser(0,x-120,y+120,0,,120,120);
			MakeEnemyLaser(0,x+120,y+140,0,,120,120);
			MakeEnemyLaser(2,x,y+150,2,,120,120).wave_effect = true;
		
			node_0 = MakeEnemyBullet(20,380,bullet_enemy_laser_piano_node_0);
			node_0.depth -= 2;
			Anim_Create(node_0,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_0.x,680,60,120);
			Anim_Create(node_0,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,700,-750,40,180);
			node_1 = MakeEnemyBullet(20,650,bullet_enemy_laser_piano_node_0);
			node_1.depth -= 2;
			Anim_Create(node_1,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_1.x,680,60,120);
			Anim_Create(node_1,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,700,-750,40,180);
		
			node_2 = MakeEnemyBullet(700,650,bullet_enemy_laser_piano_node_0);
			node_2.depth -= 2;
			Anim_Create(node_2,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_2.x,-680,60,120+30);
			Anim_Create(node_2,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,20,750,40,180+30);
			node_3 = MakeEnemyBullet(700,920,bullet_enemy_laser_piano_node_0);
			node_3.depth -= 2;
			Anim_Create(node_3,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_3.x,-680,60,120+30);
			Anim_Create(node_3,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,20,750,40,180+30);
		
			node_4 = MakeEnemyBullet(20,920,bullet_enemy_laser_piano_node_0);
			node_4.depth -= 2;
			Anim_Create(node_4,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_4.x,680,60,120+60);
			Anim_Create(node_4,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,700,-750,40,180+60);
			node_5 = MakeEnemyBullet(20,1240,bullet_enemy_laser_piano_node_0);
			node_5.depth -= 2;
			Anim_Create(node_5,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,node_5.x,680,60,120+60);
			Anim_Create(node_5,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,700,-750,40,180+60);
		}
		else{
			end_attack();
		}
	}
	if(attack_time = 110){
		ls0 = MakeEnemyBullet(0,0,bullet_enemy_laser_piano_node_laser);
		ls0.node_0 = node_0;
		ls0.node_1 = node_1;
		ls1 = MakeEnemyBullet(0,0,bullet_enemy_laser_piano_node_laser);
		ls1.node_0 = node_2;
		ls1.node_1 = node_3;
		ls2 = MakeEnemyBullet(0,0,bullet_enemy_laser_piano_node_laser);
		ls2.node_0 = node_4;
		ls2.node_1 = node_5;
	}
	if(attack_time = 300){
		node_0.destroy_type = 3;
		node_1.destroy_type = 3;
		node_2.destroy_type = 3;
		node_3.destroy_type = 3;
		node_4.destroy_type = 3;
		node_5.destroy_type = 3;
		instance_destroy(ls0);
		instance_destroy(ls1);
		instance_destroy(ls2);
		instance_destroy(node_0);
		instance_destroy(node_1);
		instance_destroy(node_2);
		instance_destroy(node_3);
		instance_destroy(node_4);
		instance_destroy(node_5);
		end_attack();
	}
}
	
attack_6 = function(){//激光齐射加节点抵挡
	live_name = "emitter_laser_piano_p2:attack_6";
	live;
	if(attack_time = 1){
		rot = 2;
		rotspd = 30;
		rotadd = 0;
		for(i=0;i<3;i+=1){
			angle = 0;
			n[i] = MakeEnemyBullet(0,0,bullet_enemy_laser_piano_node_1);
		}
	}
	if(attack_time mod 2 = 1){
		if(attack_time < 14*2){
			Laser(attack_time div 2,120-attack_time div 2,120);
			Laser(25-(attack_time div 2),120-attack_time div 2,120);
		}
		if(attack_time >= 120*2&&attack_time < 134*2){
			Laser((attack_time-120*2) div 2,120-(attack_time-120*2) div 2,120);
			Laser(25-((attack_time-120*2) div 2),120-(attack_time-120*2) div 2,120);
		}
		if(attack_time >= 240*2&&attack_time < 254*2){
			Laser((attack_time-240*2) div 2,120-(attack_time-240*2) div 2,120);
			Laser(25-((attack_time-240*2) div 2),120-(attack_time-240*2) div 2,120);
		}
	}
	if(attack_time = 240){
		n[0].duration = 1;
		Anim_Create(id,"rotspd",0,0,30,-7,60);
		Anim_Create(id,"rotadd",0,0,0,0.7,60);
	}
	if(attack_time = 480){
		n[1].duration = 1;
		Anim_Create(id,"rotspd",0,0,23,-7,60);
		Anim_Create(id,"rotadd",0,0,0.7,0.8,60);
	}
	if(attack_time = 720){
		n[2].duration = 1;
	}
	if(attack_time = 820){
		end_attack();
	}
	angle -= rot;
	rot = 2 + cos(attack_time/rotspd+3) + rotadd;
	for(i=0;i<3;i+=1){
		if(instance_exists(n[i])){
			n[i].x = 360 + lengthdir_x(300,angle+120*i);
			n[i].y = 600 + lengthdir_y(100,angle+120*i);
		}
	}
}
	
attack_7 = function(){//扫射激光
	live_name = "emitter_laser_piano_p2:attack_7";
	live;
	if(attack_time = 1){
		if!(instance_exists(bullet_enemy_laser_piano_node_0)||instance_exists(bullet_enemy_laser_piano_node_1)){
			MakeEnemyLaser(2,x-64,y+250,2,-48,,120);
			MakeEnemyLaser(2,x+64,y+250,2,-132,,120);
			ll = MakeEnemyLaser(2,x-280,y+240,2,,,120);
			Anim_Create(ll,"image_angle",0,0,-90,45,120,90);
			ll = MakeEnemyLaser(2,x-280,y+240,2,,,120);
			Anim_Create(ll,"image_angle",0,0,-90,-45,120,90);
			ll = MakeEnemyLaser(2,x+280,y+240,2,,,120);
			Anim_Create(ll,"image_angle",0,0,-90,-45,120,90);
			ll = MakeEnemyLaser(2,x+280,y+240,2,,,120);
			Anim_Create(ll,"image_angle",0,0,-90,45,120,90);
		}
		else{
			end_attack();
		}
	}
	if(attack_time > 120&&attack_time < 136){
		if(attack_time mod 2 = 0){
			Laser(5+((attack_time-120) div 2),90);
			Laser(20-((attack_time-120) div 2),90);
		}
	}
	if(attack_time = 250){
		end_attack();
	}
}
	
attack_8 = function(){//速记
	live_name = "emitter_laser_piano_p2:attack_8";
	live;
	if(attack_time < 4){
		pp = 8;
		Laser(pp+1+(attack_time-1),200,15,15);
		Laser(pp-(attack_time-1),200,15,15);
	}
	if(attack_time >= 30&&attack_time < 33){
		pp = 20;
		Laser(pp+1+(attack_time-30),200-10,15,15);
		Laser(pp-(attack_time-30),200-10,15,15);
	}
	if(attack_time >= 60&&attack_time < 63){
		pp = 12;
		Laser(pp+1+(attack_time-60),200-20,15,15);
		Laser(pp-(attack_time-60),200-20,15,15);
	}
	if(attack_time >= 90&&attack_time < 93){
		pp = 2;
		Laser(pp+1+(attack_time-90),200-30,15,15);
		Laser(pp-(attack_time-90),200-30,15,15);
	}
	if(attack_time >= 120&&attack_time < 123){
		pp = 22;
		Laser(pp+1+(attack_time-120),200-40,15,15);
		Laser(pp-(attack_time-120),200-40,15,15);
	}
	if(attack_time >= 150&&attack_time < 153){
		pp = 17;
		Laser(pp+1+(attack_time-150),200-50,15,15);
		Laser(pp-(attack_time-150),200-50,15,15);
	}
	if(attack_time >= 180&&attack_time < 183){
		pp = 6;
		Laser(pp+1+(attack_time-180),200-60,15,15);
		Laser(pp-(attack_time-180),200-60,15,15);
	}
	if(attack_time = 360){
		end_attack();
	}
}
	
attack_9 = function(){//斜方形激光节点
	live_name = "emitter_laser_piano_p2:attack_9";
	live;
	if(attack_time = 1){
		node_follow = false;
		if(instance_exists(player)){
			px = player.x;
			py = player.y;
		}
		else{
			px = mouse_x;
			py = mouse_y;
		}
		if(instance_number(bullet_enemy_laser_piano_node_0) < 8){
			for(i=0;i<4;i+=1){
				n[i] = MakeEnemyBullet(px+lengthdir_x(150,90*i),py+lengthdir_y(150,90*i),bullet_enemy_laser_piano_node_0);
				n[i].duration = 770;
			}
			node_follow = true;
			alarm[0] = 110;
		}
		else{
			end_attack();
		}
	}
	if(attack_time = 60){
		node_follow = false;
	}
	if(attack_time = 110){
		end_attack();
	}
	if(node_follow = true){
		if(instance_exists(player)){
			px += (player.x-px)/5;
			py += (player.y-py)/5;
		}
		else{
			px += (mouse_x-px)/5;
			py += (mouse_y-py)/5;
		}
		for(i=0;i<4;i+=1){
			n[i].x = px + lengthdir_x(150,90*i);
			n[i].y = py + lengthdir_y(150,90*i);
		}
	}
}
	
attack_10 = function(){//正方形激光节点
	live_name = "emitter_laser_piano_p2:attack_10";
	live;
	if(attack_time = 1){
		node_follow = false;
		if(instance_exists(player)){
			px = player.x;
			py = player.y;
		}
		else{
			px = mouse_x;
			py = mouse_y;
		}
		if(instance_number(bullet_enemy_laser_piano_node_0) < 8){
			for(i=0;i<4;i+=1){
				n[i] = MakeEnemyBullet(px+lengthdir_x(120,45+90*i),py+lengthdir_y(120,45+90*i),bullet_enemy_laser_piano_node_0);
				n[i].duration = 770;
				n[i].inv_frozen = true;
			}
			node_follow = true;
			alarm[0] = 110;
		}
		else{
			end_attack();
		}
	}
	if(attack_time = 60){
		node_follow = false;
	}
	if(attack_time = 110){
		end_attack();
	}
	if(node_follow = true){
		if(instance_exists(player)){
			px += (player.x-px)/5;
			py += (player.y-py)/5;
		}
		else{
			px += (mouse_x-px)/5;
			py += (mouse_y-py)/5;
		}
		for(i=0;i<4;i+=1){
			n[i].x = px + lengthdir_x(120,45+90*i);
			n[i].y = py + lengthdir_y(120,45+90*i);
		}
	}
}
	
against_on_top = function(){//防逃课
	if(attack_time = 1){
		if(Player_IsEnabled()){
			if(player.y < 100){
				for(i=0;i<25;i+=1){
					MakeEnemyLaser(2,laser_pos_x[i],laser_pos_y[i],2,90,60,120);
				}
			}
		}
		end_attack();
	}
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,40)
a3 = create_attack(3,attack_3,40)
a4 = create_attack(4,attack_4,40)
a5 = create_attack(5,attack_5,20)
a6 = create_attack(6,attack_6,40)
a7 = create_attack(7,attack_7,40)
a8 = create_attack(8,attack_8,40)
a9 = create_attack(9,attack_9,40,2)
a10 = create_attack(10,attack_10,40,2)
aot = create_attack(11,against_on_top,,10)

fixed_sequence = [aot,a0,a9,a3,a1,a8,a2,a6,a4,a5,a7,a10]
random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,aot]

Laser = function(index,delay,duration=1,charge_time=45){
	if(index >= 0&&index <= 25){
		a = MakeEnemyLaser(1,laser_pos_x[index],laser_pos_y[index],1,,delay,duration);
		a.charge_mode = 1;
		a.charge_time = charge_time;
	}
}

get_valid_index = function(count, skipped_indices){
	var result = count;
	for(var i = 0; i < array_length(skipped_indices); i++){
		if(skipped_indices[i] <= result){
			result++;
		}
	}
	while(array_contains(skipped_indices, result)) {
		result++;
	}
	return result;
};