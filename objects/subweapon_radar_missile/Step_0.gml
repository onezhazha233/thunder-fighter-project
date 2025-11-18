live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 4 = 1){
		if(rampage = false){
			if(bb = 0){
				angle = 45;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro);
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage

				angle = 135;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro);
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage;
			}
			if(bb = 1&&weapon_level > 0){
				angle = 70;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro);
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage

				angle = 110;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro);
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage;
			}
		}
		else{
			if(bb = 0){
				angle = 45;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro);
				a.idle = seq_missile_ab_rampage;
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.speed += 2;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage

				angle = 135;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro);
				a.idle = seq_missile_ab_rampage;
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.speed += 2;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage;
			}
			if(bb = 1){
				angle = 70;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro);
				a.idle = seq_missile_ab_rampage;
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.speed += 2;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage

				angle = 110;
				a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_rampage_intro);
				a.idle = seq_missile_ab_rampage;
				layer_sequence_angle(a.bullet_sequence,angle-90);
				a.direction = angle;
				a.image_angle = angle - 90;
				a.speed += 2;
				a.collision_effect_sequence = seq_bullet_effect_missile_b;
				a.track_inst = find_priority_enemy(bullet_player_missile);
				a.damage = damage;
			}
		}
		bb += 1;
	}
}
else{
	time = 0;
}