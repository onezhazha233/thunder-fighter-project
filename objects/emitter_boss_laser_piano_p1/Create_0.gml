//live;
event_inherited();

attack_0 = function(){//不完全左右交错
	live_name = "emitter_laser_piano_p1:attack_0";
	live;
	if(attack_time mod 4 = 1){
		if(attack_time < 8*4){
			Laser((attack_time div 4)*2,120);
		}
		if(attack_time >= 8*4&&attack_time <= 16*4){
			Laser(25-((attack_time-8*4) div 4)*2,120);
		}
	}
	if(attack_time = 140){
		end_attack();
	}
}

attack_1 = function(){//收缩扩散
	live_name = "emitter_laser_piano_p1:attack_1";
	live;
	if(attack_time mod 3 = 1){
		if(attack_time < 12*3){
			Laser(attack_time div 3,150);
			Laser(25-(attack_time div 3),150);
		}
		if(attack_time > 17*3&&attack_time < 26*3){
			Laser(12-(attack_time-17*3) div 3,150);
			Laser(13+(attack_time-17*3) div 3,150);
		}
	}
	if(attack_time = 180){
		end_attack();
	}
}

attack_2 = function(){//三连梳子
	live_name = "emitter_laser_piano_p1:attack_2";
	live;
	if(attack_time >= 0 && attack_time < 26 * 2){
	    if (attack_time mod 2 == 1) {
	        var idx = attack_time div 2;
	        if (idx mod 3 != 0) {
	            Laser(idx, 90, 30);
	        }
	    }
	}
	if(attack_time >= 150 && attack_time < 150 + (26 * 2)){
	    var sub_time = attack_time - 150;
	    if (sub_time mod 2 == 1) {
	        var idx = 25 - (sub_time div 2);
	        if (idx mod 3 != 1) {
	            Laser(idx, 90, 30);
	        }
	    }
	}
	if(attack_time >= 300 && attack_time < 300 + (13 * 3)){
	    var sub_time = attack_time - 300;
    
	    if (sub_time mod 3 == 1) {
	        var step = sub_time div 3;
	        var left_idx  = step;
	        var right_idx = 25 - step;
			
	        if (left_idx mod 3 != 2) {
	            Laser(left_idx, 90,30);
	        }
	        if (right_idx mod 3 != 0) {
	            Laser(right_idx, 90,30);
	        }
	    }
	}
	if(attack_time = 460){
		end_attack();
	}
}

attack_3 = function(){//左右交错加齐射
	live_name = "emitter_laser_piano_p1:attack_3";
	live;
	if(attack_time mod 3 = 1){
		if(attack_time < 3*9){
			Laser((attack_time div 3)*3,90);
		}
		if(attack_time > 3*15&&attack_time < 3*24){
			Laser(25-((attack_time-3*15) div 3)*3,90);
		}
	}
	if(attack_time = 120){
		for(i=0;i<8;i+=1){
			Laser(2+i*3,60,30);
		}
	}
	if(attack_time = 240){
		end_attack();
	}
}

attack_4 = function(){//两次狙
	live_name = "emitter_laser_piano_p1:attack_4";
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
		gap = 0;
	}
	if(attack_time mod 3 = 0){
		if(attack_time < 3*7){
			pp = p_idx-1-gap-(attack_time div 3);
			if(pp >= 0){
				Laser(pp,60);
			}
			pp = p_idx+1+gap+(attack_time div 3);
			if(pp <= 25){
				Laser(pp,60);
			}
			gap += (attack_time div 3);
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
		gap = 0;
	}
	if(attack_time mod 3 = 0&&attack_time > 90){
		if(attack_time < 120+3*7){
			pp = p_idx-1-gap-((attack_time-90) div 3);
			if(pp >= 0){
				Laser(pp,60);
			}
			pp = p_idx+1+gap+((attack_time-90) div 3);
			if(pp <= 25){
				Laser(pp,60);
			}
			gap += ((attack_time-90) div 3);
		}
	}
	if(attack_time = 200){
		end_attack();
	}
}

attack_5 = function(){//右四三二一
	live_name = "emitter_laser_piano_p1:attack_5";
	live;
	if(attack_time >= 0 && attack_time < 23){
		if(attack_time mod 1 = 0){
			var count = ((attack_time-1) div 1);
			var round1_idx = get_valid_index(count, [22,23,24,25]);
			if(round1_idx < 26){
				Laser(round1_idx,120,1,15);
			}
		}
	}
	
	else if(attack_time >= 23 && attack_time < 46){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 23) div 1;
			var round2_idx = get_valid_index(count, [19,20,21]);
			if(round2_idx >= 0 && round2_idx < 26){
				Laser(round2_idx,140,1,15);
			}
		}
	}
	
	else if(attack_time >= 46 && attack_time < 70){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 46) div 1;
			var round3_idx = get_valid_index(count, [17,18]);
			if(round3_idx < 26){
				Laser(round3_idx,160,1,15);
			}
		}
	}
	
	else if(attack_time >= 70 && attack_time < 95){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 70) div 1;
			var round4_idx = get_valid_index(count, [16]);
			if(round4_idx >= 0 && round4_idx < 26){
				Laser(round4_idx,180,1,15);
			}
		}
	}
	
	if(attack_time = 320){
		end_attack();
	}
}

attack_6 = function(){//左四三二一
	live_name = "emitter_laser_piano_p1:attack_6";
	live;
	if(attack_time >= 1 && attack_time < 23){
		if(attack_time mod 1 = 0){
			var count = ((attack_time-1) div 1);
			var round1_idx = get_valid_index(21-count, [0,1,2,3]);
			if(round1_idx < 26){
				Laser(round1_idx,120,1,15);
			}
		}
	}
	
	else if(attack_time >= 23 && attack_time < 46){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 23) div 1;
			var round2_idx = get_valid_index(22-count, [4,5,6]);
			if(round2_idx >= 0 && round2_idx < 26){
				Laser(round2_idx,140,1,15);
			}
		}
	}
	
	else if(attack_time >= 46 && attack_time < 70){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 46) div 1;
			var round3_idx = get_valid_index(23-count, [7,8]);
			if(round3_idx < 26){
				Laser(round3_idx,160,1,15);
			}
		}
	}
	
	else if(attack_time >= 70 && attack_time < 95){
		if(attack_time mod 1 = 0){
			var count = (attack_time - 70) div 1;
			var round4_idx = get_valid_index(24-count, [9]);
			if(round4_idx >= 0 && round4_idx < 26){
				Laser(round4_idx,180,1,15);
			}
		}
	}
	
	if(attack_time = 320){
		end_attack();
	}
}
	
attack_7 = function(){//旋转扩散激光
	live_name = "emitter_laser_piano_p1:attack_7";
	live;
	if(attack_time = 1){
		if!(instance_exists(bullet_enemy_laser_piano_node_0)||instance_exists(bullet_enemy_laser_piano_node_1)){
			bl = MakeEnemyLaser(2,x-300,y+70,2,-50,120,120); // 大激光，蓝色，角度-50，延迟120
			Anim_Create(bl,"image_angle",0,0,bl.image_angle,-15,120,120);
			bl = MakeEnemyLaser(2,x-300,y+70,2,-40,120,120); // 大激光，蓝色，角度-40，延迟120
			Anim_Create(bl,"image_angle",0,0,bl.image_angle,20,120,120);
			bl = MakeEnemyLaser(2,x+300,y+70,2,-130,120,120); // 大激光，蓝色，角度-130，延迟120
			Anim_Create(bl,"image_angle",0,0,bl.image_angle,15,120,120);
			bl = MakeEnemyLaser(2,x+300,y+70,2,-140,120,120); // 大激光，蓝色，角度-140，延迟120
			Anim_Create(bl,"image_angle",0,0,bl.image_angle,-20,120,120);
		}
		else{
			end_attack();
		}
	}
	if(attack_time = 180){
		ll = MakeEnemyLaser(1,x-120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		ll = MakeEnemyLaser(1,x-120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		Anim_Create(ll,"image_angle",0,0,ll.image_angle,-30,45,120);
		ll = MakeEnemyLaser(1,x-120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		Anim_Create(ll,"image_angle",0,0,ll.image_angle,+30,45,120);
		ll = MakeEnemyLaser(1,x+120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		ll = MakeEnemyLaser(1,x+120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		Anim_Create(ll,"image_angle",0,0,ll.image_angle,-30,45,120);
		ll = MakeEnemyLaser(1,x+120,y+260,1,-90,60,100); // 中激光，红色，角度-90，无延迟，持续时间100
		ll.depth -= 10;
		Anim_Create(ll,"image_angle",0,0,ll.image_angle,+30,45,120);
	}
	if(attack_time = 400){
		end_attack();
	}
}
	
attack_8 = function(){//激光节点
	live_name = "emitter_laser_piano_p1:attack_8";
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
		if(instance_number(bullet_enemy_laser_piano_node_0) < 4){
			un = MakeEnemyBullet(px,py-150,bullet_enemy_laser_piano_node_0);
			dn = MakeEnemyBullet(px,py+150,bullet_enemy_laser_piano_node_0);
			node_follow = true;
			un.inv_frozen = true;
			dn.inv_frozen = true;
			un.duration = 770;
			dn.duration = 770;
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
		if(instance_exists(un)){
			un.x = px;
			un.y = py-150;
		}
		if(instance_exists(dn)){
			dn.x = px;
			dn.y = py+150;
		}
	}
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,70)
a2 = create_attack(1,attack_2,60)
a3 = create_attack(1,attack_3,40)
a4 = create_attack(1,attack_4,40)
a5 = create_attack(1,attack_5,40)
a6 = create_attack(1,attack_6,40)
a7 = create_attack(1,attack_7,20)
a8 = create_attack(1,attack_8,40,4)

fixed_sequence = [a0,a1,a2,a3,a8,a4,a5,a6,a7]
random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8]

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