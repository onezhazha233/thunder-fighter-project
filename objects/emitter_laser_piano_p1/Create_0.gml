//live;
event_inherited();

attack_0 = function(){
	live_name = "emitter_laser_piano_p1:attack_0";
	live;
	if(attack_time mod 3 = 1&&attack_time < 26*3){
		if(attack_time < 13*3){
			a = MakeEnemyBullet(laser_pos_x[attack_time div 3],laser_pos_y[attack_time div 3],bullet_enemy_laser_medium);
		}
		else{
			a = MakeEnemyBullet(720-laser_pos_x[12-((attack_time-13*3) div 3)],laser_pos_y[12-((attack_time-13*3) div 3)],bullet_enemy_laser_medium);
		}
		a.delay = 60;
		a.duration = 80;
		a.charge_mode = 1;
		a.sprite_ball = spr_bullet_enemy_laser_red_ball;
		a.sprite_ring = spr_bullet_enemy_laser_red_ring;
		a.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		a.sprite_laser = spr_bullet_enemy_laser_red;
		a.sprite_effect = spr_bullet_enemy_effect_laser_red;
	}
	if(attack_time = 60*3){
		end_attack();
	}
}

attack_1 = function(){
	live_name = "emitter_laser_piano_p1:attack_1";
	live;
	if(attack_time = 1){
		aa = MakeEnemyBullet(300,500,bullet_enemy_laser_piano_node);
		bb = MakeEnemyBullet(400,800,bullet_enemy_laser_piano_node);
	}
	if(attack_time = 120){
		ll = MakeEnemyBullet(0,0,bullet_enemy_laser_piano_node_laser);
		ll.node_0 = aa;
		ll.node_1 = bb;
	}
	aa.x = 360+sin(attack_time/10+8)*200;
	bb.y = 540+sin(attack_time/10)*300;
	if(attack_time = 300){
		//end_attack();
	}
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,40)

fixed_sequence = [a1]
random_pool = [a0]