live;
event_inherited();

/* —— 原版数据(巡航导弹 zidang56, 暴走57) ——
   常态 4攻击点: [45-135]@0 + [55-125]@3(等级1起) + [65-115]@6(等级2起) + [75-105]@9(等级3起), 每点2弹
     iv=50 恒定, attackRate 369 / 369+185 / 369+185×2 / 369+185×3%
   暴走 4攻击点(同结构), iv=50, attackRate 737%+369%×3
   伤害按GM工程DPS标定换算: 每发 = DPS×iv/(60×每波弹数[2,4,6,8]) */
time_interval_idle = [50,50,50,50]
time_interval_rampage = 50

ap_delays = [0,3,6,9]

damages = [3.125,2.03125,1.77083,1.5625,3.125]
type = 2

pend_a = []
pend_d = []
rampage_prev = false

/* 单攻击点发射: a0/a1 两翼角度, rp=暴走外观 */
FireMissilePair = function(a0, a1, rp){
	var s0 = rp ? seq_missile_d_rampage_intro : seq_missile_d_intro;
	for(var i = 0; i < 2; i += 1){
		var ang = (i = 0) ? a0 : a1;
		var blt = MakePlayerBullet(x, y + 60*scale_y, bullet_player_missile, s0);
		if(rp){
			blt.idle = seq_missile_d_rampage;
			blt.collision_effect_scale_x = 1.5;
			blt.collision_effect_scale_y = 1.5;
		}
		else{
			blt.idle = seq_missile_d;
		}
		layer_sequence_angle(blt.bullet_sequence, ang - 90);
		blt.direction = ang;
		blt.image_angle = ang - 90;
		blt.collision_effect = seq_bullet_effect_missile_cd;
		blt.damage = damage;
	}
}
