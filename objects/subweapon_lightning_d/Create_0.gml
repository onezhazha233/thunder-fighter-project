live;
event_inherited();

/* —— 原版数据(闪电新星 zidang86, 暴走87) ——
   常态 #382-385: 6发扇形0°→300°, 追踪15‰, 间隔90/80/70/60
   暴走 #389: 单攻击点30帧周期(无交替), 追踪20‰, 同角度组
   attackRate 327% */
time_interval_idle = [90,80,70,60]
time_interval_rampage = 30

/* 伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkSubweapon)
   每球伤害 = DPS×间隔/(60×6球) */
damages = [1.875,2.16667,2.47917,2.5,2.5]
type = 2

volley_normal = [6,0,300]

track_perm = 0.015
track_perm_rampage = 0.02
init_v = 20

fire_sequence = seq_lightning_cd
explosion_sequence = seq_lightning_cd_explosion

bb = false

FireLightningVolley = function(cnt, ang0, ang1, rp){
	var step = (cnt > 1) ? (ang1 - ang0) / (cnt - 1) : 0;
	for(var k = 0; k < cnt; k += 1){
		var ang = ang0 + step * k;
		var tgt = find_follow_target();
		blt = MakePlayerBullet(x, y, bullet_player_lightning, fire_sequence);
		layer_sequence_angle(blt.bullet_sequence, ang - 90);
		blt.collision_effect_sequence = explosion_sequence;
		blt.dir = ang;
		blt.direction = ang;
		blt.image_angle = ang - 90;
		blt.damage = damage;
		blt.rampage = rp;
		blt.track_perm = rp ? track_perm_rampage : track_perm;
		blt.init_v = init_v;
		blt.track_inst = tgt;
		if(tgt != noone){
			blt.target_x = tgt.x;
			blt.target_y = tgt.y;
		}
		blt.InitBezier();
	}
}
