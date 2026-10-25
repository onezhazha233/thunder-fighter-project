live;
event_inherited();

/* —— 原版数据(雷达导弹 zidang52, 暴走53) ——
   常态 2攻击点: [45-135]@0 + [70-110]@6 (等级0仅主攻击点), 每点2弹
     iv=70/70/60/50, attackRate 300 / 300+200 / 250+250 / 250+250%
   暴走 2攻击点[45-135]@0 + [70-110]@6, iv=50, attackRate 500%+500%
   伤害按GM工程DPS标定换算: 每发 = DPS×iv/(60×每波弹数[2,4,4,4]) */
time_interval_idle = [70,70,60,50]
time_interval_rampage = 50

ap_delays = [0,6]

damages = [4.375,2.84375,3.1875,3.125,6.25]
type = 2

pend_a = []
pend_d = []
rampage_prev = false

/* 单攻击点发射: a0/a1 两翼角度, rp=暴走外观 */
FireMissilePair = function(a0, a1, rp){
	var s0 = rp ? seq_missile_ab_rampage_intro : seq_missile_ab_intro;
	for(var i = 0; i < 2; i += 1){
		var ang = (i = 0) ? a0 : a1;
		var blt = MakePlayerBullet(x, y + 60*scale_y, bullet_player_missile, s0);
		if(rp){
			blt.idle = seq_missile_ab_rampage;
			blt.collision_effect_scale_x = 1.5;
			blt.collision_effect_scale_y = 1.5;
		}
		layer_sequence_angle(blt.bullet_sequence, ang - 90);
		blt.direction = ang;
		blt.image_angle = ang - 90;
		blt.collision_effect = seq_bullet_effect_missile_b;
		blt.damage = damage;
	}
}
