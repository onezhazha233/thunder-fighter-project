live;
event_inherited();

mode = EMITTER_MODE.FIXED

function attack_0(){
	if(attack_time = 1){
		for(i=0;i<6;i+=1){
			b[0,i] = MakeEnemyBullet(x-130,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			b[0,i].direction = 60*i;
			b[0,i].attack_time = 0;
			with(b[0,i]){
				custom_function = function(){
					attack_time += 1;
					if(attack_time = 30){
						speed = 0;
						direction = point_direction(x,y,player.x,player.y);
						Anim_Create(id,"speed",0,0,0,10,30);
					}
				}
			}
			Anim_Create(b[0,i],"speed",0,0,8,-8,29);
		}
	}
	if(attack_time = 15){
		for(i=0;i<8;i+=1){
			b[1,i] = MakeEnemyBullet(x+130,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			b[1,i].direction = 45*i;
			b[1,i].attack_time = 0;
			with(b[1,i]){
				custom_function = function(){
					attack_time += 1;
					if(attack_time = 30){
						speed = 0;
						direction = point_direction(x,y,player.x,player.y);
						Anim_Create(id,"speed",0,0,0,10,30);
					}
				}
			}
			Anim_Create(b[1,i],"speed",0,0,7,-7,30);
		}
	}
	if(attack_time = 60){
		for(i=0;i<10;i+=1){
			b[2,i] = MakeEnemyBullet(x-130,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			b[2,i].direction = 36*i;
			b[2,i].attack_time = 0;
			with(b[2,i]){
				custom_function = function(){
					attack_time += 1;
					if(attack_time = 30){
						speed = 0;
						direction = point_direction(x,y,player.x,player.y);
						Anim_Create(id,"speed",0,0,0,10,30);
					}
				}
			}
			Anim_Create(b[2,i],"speed",0,0,6,-6,30);
		}
	}
	if(attack_time = 75){
		for(i=0;i<12;i+=1){
			b[3,i] = MakeEnemyBullet(x+130,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			b[3,i].direction = 30*i;
			b[3,i].attack_time = 0;
			with(b[3,i]){
				custom_function = function(){
					attack_time += 1;
					if(attack_time = 30){
						speed = 0;
						direction = point_direction(x,y,player.x,player.y);
						Anim_Create(id,"speed",0,0,0,10,30);
					}
				}
			}
			Anim_Create(b[3,i],"speed",0,0,6,-6,30);
		}
		end_attack();
	}
}
	
function attack_1(){
	if(attack_time mod 4 = 1){
		tt = attack_time div 2;
		for(i=0;i<3;i+=1){
			a = MakeEnemyBullet(x+72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			a.rotate = 5;
			a.direction = tt*5 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x+72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			a.rotate = 5;
			a.direction = tt*5+180 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x-72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			a.rotate = -5;
			a.direction = -tt*5 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x-72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			a.rotate = -5;
			a.direction = -tt*5+180 - 5 + i*5;
			a.speed = 8;
		}
	}
	if(attack_time = 80){
		end_attack();
	}
}
	
function attack_2(){
	if(attack_time = 1){
		for (var side = 0; side < 2; side++) {
		    var cx = x + (side == 0 ? 130 : -130);
		    var cy = y + 40;
		    var r = 100, ir = r * 0.382, ttime = 30, bpe = 6, inc = 2 * pi / 5;

		    for (i = 0; i < 5; i++) {
		        a = i * inc - pi/2;
		        ox[i] = cx + r * cos(a); oy[i] = cy + r * sin(a);
		        a += pi/5;
		        ix[i] = cx + ir * cos(a); iy[i] = cy + ir * sin(a);
		    }

		    for (i = 0; i < 5; i++) {
		        var ni = (i + 1) % 5;

		        for (j = 0; j < bpe; j++) {
		            var t = j / (bpe - 1);
		            var tx = ox[i] + (ix[i] - ox[i]) * t;
		            var ty = oy[i] + (iy[i] - oy[i]) * t;
		            var dx = tx - cx, dy = ty - cy;
		            var dist = sqrt(dx*dx + dy*dy);
		            var dir = point_direction(cx, cy, tx, ty);
		            var vel = (2 * dist) / ttime;
		            with (MakeEnemyBullet(cx, cy, bullet_enemy_normal, spr_bullet_enemy_normal_0)) {
		                direction = dir;
		                Anim_Create(id, "speed", 0, 0, vel, -vel, ttime);
		                Anim_Create(id, "speed", 0, 0, 0, -vel * 2, ttime, ttime);
		            }
		        }

		        for (j = 1; j < bpe; j++) {
		            var t = j / (bpe - 1);
		            var tx = ix[i] + (ox[ni] - ix[i]) * t;
		            var ty = iy[i] + (oy[ni] - iy[i]) * t;
		            var dx = tx - cx, dy = ty - cy;
		            var dist = sqrt(dx*dx + dy*dy);
		            var dir = point_direction(cx, cy, tx, ty);
		            var vel = (2 * dist) / ttime;
		            with (MakeEnemyBullet(cx, cy, bullet_enemy_normal, spr_bullet_enemy_normal_0)) {
		                direction = dir;
		                Anim_Create(id, "speed", 0, 0, vel, -vel, ttime);
		                Anim_Create(id, "speed", 0, 0, 0, -vel * 2, ttime, ttime);
		            }
		        }
		    }
		}
		end_attack();
	}
}
	
function attack_3(){
	if(attack_time = 1){
		for(i=0;i<10;i+=1){
			a = MakeEnemyBullet(x-72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,i*80,20+i*4);
			if(i mod 2 = 0){
				Anim_Create(a,"hspeed",0,0,0,10,30,60+i*4);
			}
			else{
				a.image_angle = 180;
				Anim_Create(a,"hspeed",0,0,0,-10,30,60+i*4);
			}
			a = MakeEnemyBullet(x+72,y+85,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,i*80,20+i*4);
			if(i mod 2 = 0){
				Anim_Create(a,"hspeed",0,0,0,10,30,60+i*4);
			}
			else{
				a.image_angle = 180;
				Anim_Create(a,"hspeed",0,0,0,-10,30,60+i*4);
			}
		}
		end_attack();
	}
}
	
var a0 = create_attack(0,attack_0,85);
var a1 = create_attack(1,attack_1,60);
var a2 = create_attack(2,attack_2,100);
var a3 = create_attack(3,attack_3,100);

fixed_sequence = [a0,a1,a2,a3];