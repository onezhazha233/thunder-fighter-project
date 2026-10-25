live;
event_inherited();

/* —— 原版数据(球形闪电 zidang82, 暴走83) ——
   常态 #362-365: 4发扇形0°→270°, 追踪15‰, initV=40, 间隔90/80/70/60
   暴走 #372/#373: 双攻击点(错相30帧)各60帧周期, 追踪20‰, 角度组0°→270°/45°→315°
   attackRate 300% */
time_interval_idle = [90,80,70,60]
time_interval_rampage = 30

/* 伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkSubweapon)
   每球伤害 = DPS×间隔/(60×4球) */
damages = [2.8125,3.25,3.71875,3.75,3.75]
type = 2

volley_normal    = [4,0,270]
volley_rampage_a = [4,0,270]
volley_rampage_b = [4,45,315]

track_perm = 0.015
track_perm_rampage = 0.02
init_v = 40

fire_sequence = seq_lightning_b
explosion_sequence = seq_lightning_b_explosion

bb = false

FindLightningTarget = function(){
	var _boss = noone;
	with(enemy_agent){
		if(object_index = boss_agent || object_is_ancestor(object_index, boss_agent)){
			if(_boss = noone)_boss = id;
		}
	}
	if(_boss != noone)return _boss;
	var _pool = [];
	with(enemy_agent){
		if(object_index = boss_agent || object_is_ancestor(object_index, boss_agent))continue;
		if(inv_collision)continue;
		if(!point_in_rectangle(x, y, -60, -60, room_width + 60, room_height + 60))continue;
		array_push(_pool, id);
	}
	if(array_length(_pool) = 0)return noone;
	return _pool[irandom(array_length(_pool) - 1)];
}

FireLightningVolley = function(cnt, ang0, ang1, rp){
	var step = (cnt > 1) ? (ang1 - ang0) / (cnt - 1) : 0;
	for(var k = 0; k < cnt; k += 1){
		var ang = ang0 + step * k;
		var tgt = FindLightningTarget();
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
