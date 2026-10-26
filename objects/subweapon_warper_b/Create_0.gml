live;
event_inherited();

// 原版 TYPE_DIVERGENT=2：参数为 [数量 a, 起始角, 结束角]
// 640x1136 -> 720x1280，角度不变，速度 x1.125
idle_angles = [28, 56]
rampage_angles = [30, 54]
idle_num = 2
rampage_num = 3
idle_biv = 6
rampage_biv = 4
idle_speed = 15.75
rampage_speed = 24.75
bullet_image_index = 1
idle_effect = seq_bullet_effect_dawn_b
rampage_effect = seq_bullet_effect_dawn_b
bullet_cover_alpha = 1.0

// 原版实际周期 = (num-1)*(biv+1) + shootInterval + biv + 2
time_interval_idle = [51, 49, 47, 45]
time_interval_rampage = 32

// 目标为“有效平均每帧伤害”（实战命中率约 50%）：
// g0-g3 / 暴走 = 0.125 / 0.1625 / 0.2125 / 0.25 / 0.5
// 名义单发伤害 = 目标DPS * 实际周期 / 每梭弹数 * 2
// 折跃弹保持原 28°/56° 扇射，不改单发方式。
damages = [1.59375, 1.990625, 2.496875, 2.8125, 2.666666]
type = 2

bursts_left = 0
burst_timer = 0

FireWarperFan = function(_rampage){
	var _angs = _rampage ? rampage_angles : idle_angles;
	var _spd = _rampage ? rampage_speed : idle_speed;
	var _eff = _rampage ? rampage_effect : idle_effect;
	for (var i = 0; i < array_length(_angs); i += 1){
		var _ang = _angs[i];
		var _b = MakePlayerBullet(x, y, bullet_player_warper);
		_b.direction = _ang;
		_b.speed = _spd;
		_b.image_angle = _ang - 90;
		_b.image_index = bullet_image_index;
		_b.collision_effect = _eff;
		_b.cover_alpha_factor = bullet_cover_alpha;
		_b.rampage = _rampage;
		_b.damage = damage;

		_b = MakePlayerBullet(x, y, bullet_player_warper);
		_b.direction = 180 - _ang;
		_b.speed = _spd;
		_b.image_angle = (180 - _ang) - 90;
		_b.image_index = bullet_image_index;
		_b.collision_effect = _eff;
		_b.cover_alpha_factor = bullet_cover_alpha;
		_b.rampage = _rampage;
		_b.damage = damage;
	}
}
