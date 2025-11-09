live;
if(time = 1){
	for(i=0;i<6;i+=1){
		b[0,i] = MakeEnemyBullet(x-130,y+40,bullet_enemy_red,spr_bullet_enemy_red_0);
		b[0,i].direction = 60*i;
		b[0,i].time = 0;
		with(b[0,i]){
			custom_function = function(){
				time += 1;
				if(time = 30){
					speed = 0;
					direction = point_direction(x,y,player.x,player.y);
					Anim_Create(id,"speed",0,0,0,10,30);
				}
			}
		}
		Anim_Create(b[0,i],"speed",0,0,8,-8,29);
	}
}
if(time = 15){
	for(i=0;i<8;i+=1){
		b[1,i] = MakeEnemyBullet(x+130,y+40,bullet_enemy_red,spr_bullet_enemy_red_0);
		b[1,i].direction = 45*i;
		b[1,i].time = 0;
		with(b[1,i]){
			custom_function = function(){
				time += 1;
				if(time = 30){
					speed = 0;
					direction = point_direction(x,y,player.x,player.y);
					Anim_Create(id,"speed",0,0,0,10,30);
				}
			}
		}
		Anim_Create(b[1,i],"speed",0,0,7,-7,30);
	}
}
if(time = 60){
	for(i=0;i<10;i+=1){
		b[2,i] = MakeEnemyBullet(x-130,y+40,bullet_enemy_red,spr_bullet_enemy_red_0);
		b[2,i].direction = 36*i;
		b[2,i].time = 0;
		with(b[2,i]){
			custom_function = function(){
				time += 1;
				if(time = 30){
					speed = 0;
					direction = point_direction(x,y,player.x,player.y);
					Anim_Create(id,"speed",0,0,0,10,30);
				}
			}
		}
		Anim_Create(b[2,i],"speed",0,0,6,-6,30);
	}
}
if(time = 75){
	for(i=0;i<12;i+=1){
		b[3,i] = MakeEnemyBullet(x+130,y+40,bullet_enemy_red,spr_bullet_enemy_red_0);
		b[3,i].direction = 30*i;
		b[3,i].time = 0;
		with(b[3,i]){
			custom_function = function(){
				time += 1;
				if(time = 30){
					speed = 0;
					direction = point_direction(x,y,player.x,player.y);
					Anim_Create(id,"speed",0,0,0,10,30);
				}
			}
		}
		Anim_Create(b[3,i],"speed",0,0,6,-6,30);
	}
}
if(time > 160&&time < 240){
	if(time mod 4 = 0){
		tt = (time-160) div 2;
		for(i=0;i<3;i+=1){
			a = MakeEnemyBullet(x+72,y+85,bullet_enemy_red,spr_bullet_enemy_red_3);
			a.rotate = 5;
			a.direction = tt*5 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x+72,y+85,bullet_enemy_red,spr_bullet_enemy_red_3);
			a.rotate = 5;
			a.direction = tt*5+180 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x-72,y+85,bullet_enemy_red,spr_bullet_enemy_red_3);
			a.rotate = -5;
			a.direction = -tt*5 - 5 + i*5;
			a.speed = 8;
			a = MakeEnemyBullet(x-72,y+85,bullet_enemy_red,spr_bullet_enemy_red_3);
			a.rotate = -5;
			a.direction = -tt*5+180 - 5 + i*5;
			a.speed = 8;
		}
	}
}
if(time = 300){
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
	            with (MakeEnemyBullet(cx, cy, bullet_enemy_red, spr_bullet_enemy_red_0)) {
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
	            with (MakeEnemyBullet(cx, cy, bullet_enemy_red, spr_bullet_enemy_red_0)) {
	                direction = dir;
	                Anim_Create(id, "speed", 0, 0, vel, -vel, ttime);
	                Anim_Create(id, "speed", 0, 0, 0, -vel * 2, ttime, ttime);
	            }
	        }
	    }
	}
}
if(time = 400){
	for(i=0;i<10;i+=1){
		a = MakeEnemyBullet(x-72,y+85,bullet_enemy_red,spr_bullet_enemy_red_2);
		Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,i*80,20+i*4);
		if(i mod 2 = 0){
			Anim_Create(a,"hspeed",0,0,0,10,30,60+i*4);
		}
		else{
			a.image_angle = 180;
			Anim_Create(a,"hspeed",0,0,0,-10,30,60+i*4);
		}
		a = MakeEnemyBullet(x+72,y+85,bullet_enemy_red,spr_bullet_enemy_red_2);
		Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,i*80,20+i*4);
		if(i mod 2 = 0){
			Anim_Create(a,"hspeed",0,0,0,10,30,60+i*4);
		}
		else{
			a.image_angle = 180;
			Anim_Create(a,"hspeed",0,0,0,-10,30,60+i*4);
		}
	}
}