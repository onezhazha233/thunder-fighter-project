live;
event_inherited();

 if (time >= 1 && time < 240) { 
	 if (time % 8 == 0) {
		 var petal_count = 8;
		 var base_angle = (time / 8) * 15; 
		 var ring_radius = 60 + sin(time * 0.05) * 20; // 动态半径

    for (var i = 0; i < petal_count; i++) {
        var angle = base_angle + (360 / petal_count) * i;
        var bullet_x = x + lengthdir_x(ring_radius, angle);
        var bullet_y = y + lengthdir_y(ring_radius, angle);
        
        var bullet = instance_create_depth(bullet_x, bullet_y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_2; // 长椭圆
        bullet.speed = 2.5;
        bullet.direction = angle;
        bullet.image_angle = angle;
        
        // 添加弯曲轨迹动画
        Anim_Create(bullet, "direction", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, angle, 45 * sin(angle * pi / 180), 120, 30);
        Anim_Create(bullet, "speed", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 2.5, -1, 60, 60);
    }
}
}

if (time >= 240 && time < 480) {
	if ((time - 240) % 6 == 0) { 
		for (var spiral = 0; spiral < 2; spiral++) { 
			var spiral_angle = (time - 240) * 8 + spiral * 180; 
			var spiral_radius = 40 + ((time - 240) * 0.3);

        var bullet_x = x + lengthdir_x(spiral_radius, spiral_angle);
        var bullet_y = y + lengthdir_y(spiral_radius, spiral_angle);
        
        var bullet = instance_create_depth(bullet_x, bullet_y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_1; // 尖形
        bullet.speed = 1.8;
        
        // 初始朝向玩家
        if (instance_exists(player)) {
            bullet.direction = point_direction(bullet_x, bullet_y, player.x, player.y);
        } else {
            bullet.direction = spiral_angle + 90;
        }
        bullet.image_angle = bullet.direction;
        
        // 延迟后改变方向，形成弯曲轨迹
        var new_dir = spiral_angle + 90 + sin(spiral_angle * pi / 180) * 60;
        Anim_Create(bullet, "direction", ANIM_TWEEN.BACK, ANIM_EASE.OUT, bullet.direction, new_dir - bullet.direction, 40, 45);
        Anim_Create(bullet, "speed", ANIM_TWEEN.ELASTIC, ANIM_EASE.OUT, 1.8, 1.2, 30, 45);
    }
}
}

if (time >= 480 && time < 720) { 
	if ((time - 480) % 25 == 0) { 
		var burst_count = 16;
		var burst_phase = floor((time - 480) / 25);

    for (var i = 0; i < burst_count; i++) {
        var angle = (360 / burst_count) * i + burst_phase * 11.25; // 每次旋转11.25度
        
        var bullet = instance_create_depth(x, y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_3; // 菱形
        bullet.speed = 4;
        bullet.direction = angle;
        bullet.image_angle = angle;
        
        // 先快速扩散，然后减速并转向中心
        Anim_Create(bullet, "speed", ANIM_TWEEN.QUART, ANIM_EASE.OUT, 4, -2.5, 45, 0);
        
        // 延迟后朝向玩家收束
        if (instance_exists(player)) {
            var target_dir = point_direction(x, y, player.x, player.y);
            var dir_diff = angle_difference(target_dir, angle);
            Anim_Create(bullet, "direction", ANIM_TWEEN.CIRC, ANIM_EASE.IN_OUT, angle, dir_diff, 60, 80);
            Anim_Create(bullet, "speed", ANIM_TWEEN.QUAD, ANIM_EASE.IN, 1.5, 2, 40, 120);
        }
    }
}
}

if (time >= 720 && time < 960) {
	if ((time - 720) % 4 == 0) { 
		var wave_progress = (time - 720) / 240.0; 
		var bullets_per_wave = 5;

    for (var i = 0; i < bullets_per_wave; i++) {
        var wave_offset = (i - 2) * 45; // -90到90度范围
        var base_direction = 270; // 向下
        var wave_amplitude = 30 * sin(wave_progress * pi * 4);
        var final_direction = base_direction + wave_offset + wave_amplitude;
        
        var bullet = instance_create_depth(x, y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_0; // 圆形
        bullet.speed = 2.8;
        bullet.direction = final_direction;
        
        // 添加持续的波浪运动
        var wave_change = 25 * sin((wave_progress + i * 0.2) * pi * 2);
        Anim_Create(bullet, "direction", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, final_direction, wave_change, 80, 20);
        Anim_Create(bullet, "direction", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, final_direction + wave_change, -wave_change * 2, 80, 100);
    }
}
}

if (time >= 960 && time < 1200) { 
	var final_phase = time - 960;

// 中心爆发弹幕
if (final_phase % 15 == 0) {
    var center_bullets = 12;
    for (var i = 0; i < center_bullets; i++) {
        var angle = (360 / center_bullets) * i + final_phase * 3;
        
        var bullet = instance_create_depth(x, y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_1; // 尖形
        bullet.speed = 3.5;
        bullet.direction = angle;
        bullet.image_angle = angle;
        
        // 分裂效果
        Anim_Create(bullet, "speed", ANIM_TWEEN.EXPO, ANIM_EASE.OUT, 3.5, -2, 30, 0);
        
        // 第二阶段分裂
        var split_dir1 = angle + 15;
        var split_dir2 = angle - 15;
        Anim_Create(bullet, "direction", ANIM_TWEEN.BOUNCE, ANIM_EASE.OUT, angle, 15, 20, 50);
        
        // 创建分裂子弹
        if (i % 3 == 0) {
            var split_bullet = instance_create_depth(x, y, 0, bullet_enemy_red);
            split_bullet.sprite_index = spr_bullet_enemy_red_0; // 圆形
            split_bullet.speed = 2;
            split_bullet.direction = angle + 30;
            Anim_Create(split_bullet, "speed", ANIM_TWEEN.BACK, ANIM_EASE.OUT, 0, 2, 25, 50);
        }
    }
}

// 追踪弹幕
if (final_phase % 20 == 0 && instance_exists(player)) {
    for (var track = 0; track < 3; track++) {
        var bullet = instance_create_depth(x, y, 0, bullet_enemy_red);
        bullet.sprite_index = spr_bullet_enemy_red_2; // 长椭圆
        bullet.speed = 1.5 + track * 0.3;
        bullet.direction = point_direction(x, y, player.x, player.y) + (track - 1) * 20;
        bullet.image_angle = bullet.direction;
        
        // 延迟追踪
        Anim_Create(bullet, "speed", ANIM_TWEEN.CIRC, ANIM_EASE.IN, bullet.speed, 1.5, 40, 60 + track * 15);
    }
}
}