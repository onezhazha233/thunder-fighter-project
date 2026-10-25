live;
event_inherited();

/* —— 原版数据(涡轮闪电 zidang84, 暴走85) ——
   常态 #374-377: 5发扇形54°→342°, 追踪15‰, 间隔90/80/70/60
   暴走 #381: 单攻击点30帧周期(无交替), 追踪20‰, 同角度组
   attackRate 240% */
time_interval_idle = [90,80,70,60]
time_interval_rampage = 30

/* 伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkSubweapon)
   每球伤害 = DPS×间隔/(60×5球) */
damages = [2.25,2.6,2.975,3,3]
type = 2

volley_normal = [5,54,342]

track_perm = 0.015
track_perm_rampage = 0.02
init_v = 20

fire_sequence = seq_lightning_cd
explosion_sequence = seq_lightning_cd_explosion

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
