live;
event_inherited();

/* —— 原版数据(闪电球 zidang80, 暴走81) ——
   常态 #350-353: 3发扇形30°→270°, 追踪15‰, 间隔90/80/70/60(按武器等级)
   暴走 #360/#361: 双攻击点(错相30帧)各60帧周期, 追踪20‰, 角度组30°→270°/90°→330°
   attackRate 400%: 各等级与暴走均不变(原版品质只改装备攻击力) */
time_interval_idle = [90,80,70,60]
time_interval_rampage = 30

/* 伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkSubweapon)
   每球伤害 = DPS×间隔/(60×3球) */
damages = [3.75,4.33333,4.95833,5,5]
type = 2

volley_normal    = [3,30,270]
volley_rampage_a = [3,30,270]
volley_rampage_b = [3,90,330]

track_perm = 0.015
track_perm_rampage = 0.02
init_v = 20

fire_sequence = seq_lightning_a
explosion_sequence = seq_lightning_a_explosion

bb = false

/* 原版 pickRandomFollowTarget: 优先BOSS, 否则随机合适敌机 → 统一走 find_follow_target() */

/* 原版 case_TYPE_FOLLOW: 起始角→结束角等分扇形射出, 每弹独立锁敌 */
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
