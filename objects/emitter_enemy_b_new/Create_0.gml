live;
event_inherited();

mode = EMITTER_MODE.FIXED;

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