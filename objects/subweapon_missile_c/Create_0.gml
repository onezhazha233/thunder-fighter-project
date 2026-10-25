live;
event_inherited();

/* —— 原版数据(弹道导弹 zidang54, 暴走55) ——
   常态 3攻击点: [45-135]@0 + [60-120]@5(等级1起) + [75-105]@10(等级2起), 每点2弹
     iv=60/60/60/50, attackRate 200 / 200+150 / 200+150+150 / 200+150+150%
   暴走 3攻击点(同结构), iv=50, attackRate 400%+300%+300%
   伤害按GM工程DPS标定换算: 每发 = DPS×iv/(60×每波弹数[2,4,6,6]) */
time_interval_idle = [60,60,60,50]
time_interval_rampage = 50

ap_delays = [0,5,10]

damages = [3.75,2.4375,2.125,2.08333,4.16667]
type = 2

pend_a = []
pend_d = []
rampage_prev = false

/* 单攻击点发射: a0/a1 两翼角度, rp=暴走外观 */
FireMissilePair = function(a0, a1, rp){
	var s0 = rp ? seq_missile_c_rampage_intro : seq_missile_c_intro;
	for(var i = 0; i < 2; i += 1){
		var ang = (i = 0) ? a0 : a1;
		var blt = MakePlayerBullet(x, y + 60*scale_y, bullet_player_missile, s0);
		if(rp){
			blt.idle = seq_missile_c_rampage;
			blt.collision_effect_scale_x = 1.5;
			blt.collision_effect_scale_y = 1.5;
		}
		else{
			blt.idle = seq_missile_c;
		}
		layer_sequence_angle(blt.bullet_sequence, ang - 90);
		blt.direction = ang;
		blt.image_angle = ang - 90;
		blt.collision_effect = seq_bullet_effect_missile_cd;
		blt.damage = damage;
	}
}
