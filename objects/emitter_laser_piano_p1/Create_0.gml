//live;
event_inherited();

enabled = true

attack_0 = function(){
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

attack_1 = function(){
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

attack_2 = function(){
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

attack_3 = function(){
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

attack_4 = function(){
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
		p_idx = 12; // 默认值防错
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

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,70)
a2 = create_attack(1,attack_2,60)
a3 = create_attack(1,attack_3,40)
a4 = create_attack(1,attack_4,40)

fixed_sequence = [a4]
random_pool = [a4]

Laser = function(index,delay,duration=1,charge_time=45){
	a = MakeEnemyBullet(laser_pos_x[index],laser_pos_y[index],bullet_enemy_laser_medium);
	a.delay = delay;
	a.duration = duration;
	a.charge_mode = 1;
	a.charge_time = charge_time;
	a.sprite_ball = spr_bullet_enemy_laser_red_ball;
	a.sprite_ring = spr_bullet_enemy_laser_red_ring;
	a.sprite_laser_start = spr_bullet_enemy_laser_red_start;
	a.sprite_laser = spr_bullet_enemy_laser_red;
	a.sprite_effect = spr_bullet_enemy_effect_laser_red;
}