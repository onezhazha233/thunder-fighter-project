live;
event_inherited();

if(enabled = true){
	if (fire_count > 0) {
		fire_timer -= 1;
		if (fire_timer <= 0) {
			var total = fire_count;
			var idx = fire_step;
			if (fire_reverse) {
				idx = total - 1 - fire_step;
			}
			var dir = 90 + angle_range[weapon_level] - angle_range[weapon_level] / (1 + weapon_level) * idx * 2;
			var blt = MakePlayerBullet(x, y, bullet_player_plane_boomerang);
			blt.direction = dir;
			blt.speed = 50-abs(dir-90)/5;
			blt.acceleration = 1.8;
			blt.spd_start = blt.speed;

			fire_step += 1;
			if (fire_step >= total) {
				fire_count = 0;
				fire_step = 0;
				fire_timer = 0;
			} else {
				fire_timer = 4;
			}
		}
	}
}