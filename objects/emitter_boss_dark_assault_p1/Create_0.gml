live;
event_inherited();

function attack_empty_80(){//80帧前摇
	if(attack_time = 80){
		end_attack();
	}
}

function attack_0(){//四向散射 40
	if(attack_time < 40&&attack_time mod 6 = 1){
		for(i=0;i<4;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_darkred_0);
				blt.direction = i*90+45+j*5+time*10;
				blt.speed = 15-j;
			}
		}
	}
	if(attack_time = 40){
		end_attack();
	}
}

function attack_1(){//延迟散射 40
	if(attack_time >= 1&&attack_time <= 31&&attack_time mod 5 = 1){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		var blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_darkred_0);
		blt.image_xscale = 2;
		blt.image_yscale = 1;
		blt.direction = dir;
		blt.image_angle = blt.direction;
		blt.speed = 3;
		blt.duration = 60;
		blt.ii = time;
		with(blt){
			custom_function = function(){
				if(duration = 1){
					for(var i=0;i<6;i+=1){
						var s = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_darkred_0);
						s.mark = other.mark;
						s.direction = i*60+ii*10;
						s.speed = 10;
					}
				}
			}
		}
	}
	if(attack_time = 40){
		end_attack();
	}
}

function attack_2(){//连射狙 40
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack_time >= 1&&attack_time <= 31&&attack_time mod 5 = 1){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		var blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_darkred_0);
		blt.direction = dir;
		blt.speed = 15;
	}
	if(attack_time = 40){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

function attack_3(){//机炮 210
	if(attack_time = 1){
		mark.move_range[3] -= 500;
		mark.SetSequence(seq_enemy_boss_large_15_p1_attack_intro);
	}
	if(attack_time = 60){
		mark.SetSequence(seq_enemy_boss_large_15_p1_attack);
	}
	if(attack_time > 60 && attack_time < 180){
		if(attack_time mod 4 = 0){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_dark_assault);
			blt.vspeed = 45;
		}
	}
	if(attack_time = 180){
		mark.SetMoveInfo();
		mark.SetIdle();
	}
	if(attack_time = 210){
		end_attack();
	}
}

function attack_4(){//激光 80
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		l = MakeEnemyBullet(x,y+85,bullet_enemy_laser_green);
		l.delay = 40;
		l.duration = 30;
	}
	if(attack_time = 80){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

function attack_5(){//机关炮 50
	if(attack_time = 1){
		mark.move_range[3] -= 500;
	}
	if(attack_time = 20){
		sc = MakeEnemyBullet(x,y,bullet_enemy_dark_assault_shotcannon);
		sc.duration = 120;
	}
	if(attack_time = 50){
		if(sc.x < room_width/2){
			sc.hspeed = 2;
		}
		else{
			sc.hspeed = -2;
		}
		mark.SetMoveInfo();
		end_attack();
	}
}

function attack_6(){//中心散射 40
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack_time = 20){
		for(i=0;i<12;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_darkred_0);
				blt.direction = 30*i;
				blt.speed = 18-j;
				Anim_Create(blt,"speed",0,0,18-j,-5-j,0,10);
			}
		}
	}
	if(attack_time = 40){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

var ae = create_attack(999, attack_empty_80);
var a0 = create_attack(0, attack_0,10);
var a1 = create_attack(1, attack_1,60);
var a2 = create_attack(2, attack_2,10);
var a3 = create_attack(3, attack_3,10);
var a4 = create_attack(4, attack_4,20);
var a5 = create_attack(5, attack_5,130);
var a6 = create_attack(6, attack_6,20);

fixed_sequence = [ae,a1,a2,a0,a4];
random_pool = [a0,a1,a2,a3,a4,a5,a6]