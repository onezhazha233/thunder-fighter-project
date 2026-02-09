live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 4 = 1){
		if(rampage = false){
			if(bb = 0){
				angle = 45;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 135;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
			if(bb = 1&&weapon_level > 0){
				angle = 60;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 120;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
			if(bb = 2&&weapon_level > 1){
				angle = 75;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 105;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_intro);
				blt.idle = seq_missile_c;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
		}
		else{
			if(bb = 0){
				angle = 45;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 135;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
			if(bb = 1){
				angle = 60;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 120;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
			if(bb = 2){
				angle = 75;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;

				angle = 105;
				blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_c_rampage_intro);
				blt.idle = seq_missile_c_rampage;
				blt.collision_effect_scale_x = 1.5;
				blt.collision_effect_scale_y = 1.5;
				layer_sequence_angle(blt.bullet_sequence,angle-90);
				blt.direction = angle;
				blt.image_angle = angle - 90;
				blt.speed += 2;
				blt.collision_effect = seq_bullet_effect_missile_cd;
				blt.track_inst = find_priority_enemy(bullet_player_missile);
				blt.damage = damage;
			}
		}
		bb += 1;
	}
}
else{
	time = 0;
}