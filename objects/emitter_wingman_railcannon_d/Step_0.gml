live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1;
		damage = 2.5833*global.atk_wingman;
		a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon);
		a.sprite_index = spr_bullet_player_railcannon_d;
		a.collision_effect_sequence = seq_bullet_effect_railcannon_d;
		a.rampage = true;
		if(dir = 0){
			a.image_angle += 7+10*bb;
			a.x += 6*bb;
		}
		else{
			a.image_angle -= 7+10*bb;
			a.x -= 6*bb;
		}
		a.direction = a.image_angle + 90;
		a.speed = 45;
		a.damage = damage;
		bb += 1;
	}
}
else{
	time = 0;
}