live;
event_inherited();

mode = EMITTER_MODE.FIXED;

function attack_slice(){
	if(attack_time = 30){
		dd = -800;
		sx = room_width;
		sy = 200;
		ex = 0;
		ey = 200+100;
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)+90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,90);
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)-90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,90);
		inst.duration = 150;
		for(i=0;i<40;i+=1){
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = -i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
		}
	}
	if(attack_time = 40){
		dd = -801;
		sx = 0;
		sy = 300;
		ex = room_width;
		ey = 300+100;
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)+90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,80);
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)-90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,80);
		inst.duration = 150;
		for(i=0;i<40;i+=1){
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = -i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
		}
	}
	if(attack_time = 50){
		dd = -802;
		sx = room_width;
		sy = 400;
		ex = 0;
		ey = 400+100;
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)+90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,70);
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)-90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,70);
		inst.duration = 150;
		for(i=0;i<40;i+=1){
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = -i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
		}
	}
	if(attack_time = 60){
		dd = -801;
		sx = 0;
		sy = 500;
		ex = room_width;
		ey = 500+100;
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)+90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,60);
		var inst = instance_create_depth((sx+ex)/2,(sy+ey)/2,dd,camera_split);
	    inst.image_angle = point_direction(sx,sy,ex,ey)-90;
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,30,30);
		Anim_Create(inst,"offset",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,30,-30,30,60);
		inst.duration = 150;
		for(i=0;i<40;i+=1){
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
			a = MakeEnemyBullet(sx+(ex-sx)/40*i,sy+(ey-sy)/40*i,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = -i*9;
			Anim_Create(a,"speed",0,0,-3,10,20,30+i);
		}
	}
}

function attack_0(){
    // 处理第一部分
    if (attack_time >= 1 && attack_time <= 26) {
        if ((attack_time - 1) % 5 == 0) {
            var dd = point_direction(x, y, player.x, player.y);
            var a = instance_create_depth(x, y, 0, bullet_enemy_red);
            a.sprite_index = spr_bullet_enemy_red_1;
            a.image_angle = dd;
            a.direction = a.image_angle;
            a.speed = -15;
            Anim_Create(a, "speed", 0, 0, -15, 25, 25);
            a.mark = mark;
        }
    }
    // 处理第二部分
    if (attack_time >= 20 && attack_time <= 41) {
        if ((attack_time - 20) % 3 == 0) {
            var dd = point_direction(x, y, player.x, player.y);
            var _offset = (attack_time - 20) div 3;
			i=0;
            repeat(2) { // 简化代码
                var side = (i == 0) ? -60 : 60;
                var a = instance_create_depth(x, y, 0, bullet_enemy_red);
                a.sprite_index = spr_bullet_enemy_red_1;
                a.image_angle = dd + side;
                a.direction = a.image_angle;
                Anim_Create(a, "image_angle", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, a.image_angle, (i == 0 ? 90 : -90) - _offset * 2 * (i == 0 ? 1 : -1), 40);
                Anim_Create(a, "direction", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, a.direction, (i == 0 ? 90 : -90) - _offset * 2 * (i == 0 ? 1 : -1), 40);
                a.speed = 15; a.mark = mark;
				i+=1;
            }
        }
    }
    if (attack_time >= 50) end_attack(); // 增加等待时间补齐 250 帧分配
}

function attack_1(){
    if (attack_time == 1) pd = point_direction(x, y, player.x, player.y);
    
    // 顺时针
    if (attack_time >= 1 && attack_time <= 13) {
        if ((attack_time - 1) % 3 == 0) {
            for(var i=0; i<5; i++){
                var dd = pd + ((attack_time - 1) div 3) * 5;
                var a = instance_create_depth(x, y, 0, bullet_enemy_red);
                a.sprite_index = spr_bullet_enemy_red_1;
                a.image_angle = 72 * i + dd;
                a.direction = a.image_angle;
                a.speed = 20;
                Anim_Create(a, "speed", 0, 0, 20, -12, 3);
                a.mark = mark;
            }
        }
    }
    // 逆时针
    if (attack_time >= 30 && attack_time <= 42) {
        if ((attack_time - 30) % 3 == 0) {
            for(var i=0; i<5; i++){
                var dd = pd - ((attack_time - 30) div 3) * 5;
                var a = instance_create_depth(x, y, 0, bullet_enemy_red);
                a.sprite_index = spr_bullet_enemy_red_1;
                a.image_angle = 72 * i + dd;
                a.direction = a.image_angle;
                a.speed = 20;
                Anim_Create(a, "speed", 0, 0, 20, -12, 3);
                a.mark = mark;
            }
        }
    }
    if (attack_time >= 50) end_attack();
}

function attack_2(){
    if (attack_time == 1) pd = point_direction(x, y, player.x, player.y);
    if (attack_time >= 1 && attack_time <= 46) {
        if ((attack_time - 1) % 15 == 0) {
            for(var i=0; i<4; i++){
                dd = pd + ((attack_time-1) div 15)*10+5;
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_2;
				a.image_angle = dd;
				a.direction = a.image_angle;
				a.speed = 0;
				Anim_Create(a,"speed",0,0,0,15+i*2,100);
				a.mark = mark;
				dd = pd - ((attack_time-1) div 15)*10-5;
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_2;
				a.image_angle = dd;
				a.direction = a.image_angle;
				a.speed = 0;
				Anim_Create(a,"speed",0,0,0,15+i*2,100);
				a.mark = mark;
            }
        }
    }
    if (attack_time >= 50) end_attack();
}

var a0 = create_attack(1,attack_0,40);
var a1 = create_attack(2,attack_1,30);
var a2 = create_attack(3,attack_2,30);

fixed_sequence = [a0,a1,a2]