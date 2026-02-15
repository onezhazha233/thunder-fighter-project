live;
event_inherited();

duration = -1
loop = false

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = [40,40,40,210,80,50,40]
last_attack = -1

attack_list = ds_list_create()

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			if(inv_block = true){
				destroy_type = 4;
			}
			else{
				destroy_type = 1;
			}
			instance_destroy();
		}
	}
}

function start_attack(attack_type,arg=0){
	attack = {
		type : attack_type,
		time : 0,
		active : true,
		exarg : arg,
		
		End : function(){
			active = false;
		}
	}
	
	ds_list_add(attack_list,attack);
}

function run_attack(attack){
	switch(attack.type){
		case 0: attack_0(attack,attack.exarg); break;
		case 1: attack_1(attack,attack.exarg); break;
		case 2: attack_2(attack,attack.exarg); break;
		case 3: attack_3(attack,attack.exarg); break;
		case 4: attack_4(attack,attack.exarg); break;
		case 5: attack_5(attack,attack.exarg); break;
		case 6: attack_6(attack,attack.exarg); break;
	}
}

function attack_0(attack,exarg=0){//四向散射 40
	if(attack.time < 40&&attack.time mod 6 = 1){
		for(i=0;i<4;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
				blt.direction = i*90+45+j*5+time*10;
				blt.speed = 15-j;
			}
		}
	}
	if(attack.time = 40){
		attack.End();
	}
}

function attack_1(attack,exarg=0){//延迟散射 40
	if(attack.time >= 1&&attack.time <= 31&&attack.time mod 5 = 1){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
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
						var s = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
						s.mark = other.mark;
						s.direction = i*60+ii*10;
						s.speed = 10;
					}
				}
			}
		}
	}
	if(attack.time = 40){
		attack.End();
	}
}

function attack_2(attack,exarg=0){//连射狙 40
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time >= 1&&attack.time <= 31&&attack.time mod 5 = 1){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
		blt.direction = dir;
		blt.speed = 15;
	}
	if(attack.time = 40){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_3(attack,exarg=0){//机炮 210
	if(attack.time = 1){
		mark.move_range[3] -= 500;
		mark.SetSequence(seq_enemy_boss_large_15_p1_attack_intro);
	}
	if(attack.time = 60){
		mark.SetSequence(seq_enemy_boss_large_15_p1_attack);
	}
	if(attack.time > 60 && attack.time < 180){
		if(attack.time mod 4 = 0){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_dark_assault);
			blt.vspeed = 45;
		}
	}
	if(attack.time = 180){
		mark.move_range[3] += 500;
		mark.SetState(ENEMY_STATE.IDLE);
	}
	if(attack.time = 210){
		attack.End();
	}
}

function attack_4(attack,exarg=0){//激光 80
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		l = MakeEnemyBullet(x,y+85,bullet_enemy_laser_green);
		l.delay = 40;
		l.duration = 30;
	}
	if(attack.time = 80){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_5(attack,exarg=0){//机关炮 50
	if(attack.time = 1){
		mark.move_range[3] -= 500;
	}
	if(attack.time = 20){
		sc = MakeEnemyBullet(x,y,bullet_enemy_dark_assault_shotcannon);
		sc.duration = 120;
	}
	if(attack.time = 50){
		if(sc.x < room_width/2){
			sc.hspeed = 2;
		}
		else{
			sc.hspeed = -2;
		}
		mark.move_range[3] += 500;
		attack.End();
	}
}

function attack_6(attack,exarg=0){//中心散射 40
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time = 20){
		for(i=0;i<12;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
				blt.direction = 30*i;
				blt.speed = 18-j;
				Anim_Create(blt,"speed",0,0,18-j,-5-j,0,10);
			}
		}
	}
	if(attack.time = 40){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}