live;
event_inherited();

duration = -1
loop = false

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = [60,100,50,210,120,180,150]
last_attack = -1

attack_list = ds_list_create()

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

function attack_0(attack,exarg=0){//三四五六向散射狙 40
	if(attack.time < 40&&attack.time mod 12 = 1){
		num = attack.time div 12+3;
		for(j=0;j<num;j+=1){
			pd = -90;
			if(Player_IsEnabled()){
				pd = point_direction(x,y,player.x,player.y);
			}
			dd = 360/num*j+pd;
			for(i=0;i<4;i+=1){
				if(i = 0){
					blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
					blt.direction = 0+dd;
					blt.speed = 12;
				}
				else{
					blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
					blt.direction = i*3+dd;
					blt.speed = 12-i/2;
					blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
					blt.direction = -i*3+dd;
					blt.speed = 12-i/2;
				}
			}
		}
	}
	if(attack.time = 40){
		attack.End();
	}
}

function attack_1(attack,exarg=0){//延迟狙 90
	if(attack.time >= 1&&attack.time <= 31&&attack.time mod 5 = 1){
		var dir = -90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
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
					for(var i=0;i<10;i+=1){
						var s = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
						s.mark = other.mark;
						dd = -90;
						if(Player_IsEnabled())dd = point_direction(x,y,player.x,player.y);
						td = 200;
						if(Player_IsEnabled())td = point_distance(x,y,player.x,player.y);
						Anim_Create(s,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(max(td/10,30)*(i+1),dd),30);
						Anim_Create(s,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(max(td/10,30)*(i+1),dd),30);
						s.direction = dd;
						Anim_Create(s,"speed",0,0,0,10+i,20,50);
					}
				}
			}
		}
	}
	if(attack.time = 90){
		attack.End();
	}
}

function attack_2(attack,exarg=0){//连射斜线狙 40
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time >= 1&&attack.time <= 31&&attack.time mod 10 = 1){
		var dir = -90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		if((attack.time div 10) mod 2 = 0){
			for(i=0;i<5;i+=1){
				var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
				blt.direction = dir+i*3;
				blt.speed = 13-i;
			}
		}
		else{
			for(i=0;i<5;i+=1){
				var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
				blt.direction = dir-i*3;
				blt.speed = 13-i;
			}
		}
	}
	if(attack.time = 40){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_3(attack,exarg=0){//机炮 210
	if(attack.time = 1){
		mark.move_range[3] -= 500;
		mark.SetSequence(seq_enemy_boss_large_og0_p1_attack_intro);
	}
	if(attack.time = 60){
		mark.SetSequence(seq_enemy_boss_large_og0_p1_attack);
	}
	if(attack.time > 60 && attack.time < 180){
		if(attack.time mod 4 = 0){
			var blt = MakeEnemyBullet(x,y+50,bullet_enemy_umbra_apex);
			blt.vspeed = 45;
		}
	}
	if(attack.time = 180){
		mark.mark.SetMoveInfo();
		mark.SetIdle();
	}
	if(attack.time = 210){
		attack.End();
	}
}

function attack_4(attack,exarg=0){//激光 80
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		l = MakeEnemyBullet(x-32,y+25,bullet_enemy_laser_green);
		l.delay = 40;
		l.duration = 30;
		l.sprite_ball = spr_bullet_enemy_laser_red_ball;
		l.sprite_ring = spr_bullet_enemy_laser_red_ring;
		l.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		l.sprite_laser = spr_bullet_enemy_laser_red;
		l.sprite_effect = spr_bullet_enemy_effect_laser_red;
		l = MakeEnemyBullet(x+32,y+25,bullet_enemy_laser_green);
		l.delay = 40;
		l.duration = 30;
		l.sprite_ball = spr_bullet_enemy_laser_red_ball;
		l.sprite_ring = spr_bullet_enemy_laser_red_ring;
		l.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		l.sprite_laser = spr_bullet_enemy_laser_red;
		l.sprite_effect = spr_bullet_enemy_effect_laser_red;
	}
	if(attack.time = 80){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_5(attack,exarg=0){//米加 90
	if(attack.time = 1){
		mark.move_range[3] -= 500;
	}
	if(attack.time mod 20 = 1){
		rl = 250;
		ra = sin(attack.time*987)*360;
		xx = clamp(player.x + lengthdir_x(rl,ra),10,710);
		yy = clamp(player.y + lengthdir_y(rl,ra),10,1270);
		mg = MakeEnemyBullet(xx,yy,bullet_enemy_umbra_apex_mega);
		mg.image_angle = point_direction(xx,yy,player.x,player.y);
	}
	if(attack.time = 90){
		mark.SetMoveInfo();
		attack.End();
	}
}

function attack_6(attack,exarg=0){//等边三角散射 90
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time = 20){
		for (var i = 0; i < 12; i += 1){
		    var t = i / 11;
		    var px = lerp(0, 0.8660254, t);
		    var py = lerp(-1, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
			Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*18,60);
		    px = lerp(0.8660254, -0.8660254, t);
		    py = lerp(0.5, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
			Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*18,60);
		    px = lerp(-0.8660254, 0, t);
		    py = lerp(0.5, -1, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
			Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*18,60);
		}
	}
	if(attack.time = 40){
		for (var i = 0; i < 12; i += 1){
		    var t = i / 11;
		    var px = lerp(0, 0.8660254, t);
		    var py = lerp(-1, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py);
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*15,60);
		    px = lerp(0.8660254, -0.8660254, t);
		    py = lerp(0.5, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py);
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*15,60);
		    px = lerp(-0.8660254, 0, t);
		    py = lerp(0.5, -1, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py);
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*15,60);
		}
	}
	if(attack.time = 60){
		for (var i = 0; i < 12; i += 1){
		    var t = i / 11;
		    var px = lerp(0, 0.8660254, t);
		    var py = lerp(-1, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*12,60);
		    px = lerp(0.8660254, -0.8660254, t);
		    py = lerp(0.5, 0.5, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*12,60);
		    px = lerp(-0.8660254, 0, t);
		    py = lerp(0.5, -1, t);
		    blt = MakeEnemyBullet(x, y, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
		    blt.direction = point_direction(0, 0, px, py)+180;
		    Anim_Create(blt,"speed",0,0,blt.speed,point_distance(0,0,px,py)*12,60);
		}
	}
	if(attack.time = 90){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}
