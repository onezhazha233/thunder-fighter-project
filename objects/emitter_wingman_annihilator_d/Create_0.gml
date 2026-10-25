live;
event_inherited();

/* —— 原版数据(终结歼灭炮 zidang310, 暴走311) ——
   常态 wing09d-01: attackRate 12%, 70帧周期, 弹数6/7/8/9(按武器等级),
     每弹角度 -(5+10k), 追踪30‰, 攻击点错相 standby=6*(k mod 4)
   暴走 wing09d-02: attackRate 8%, 15帧周期, 固定10弹, 角度-(8+10k), 追踪40‰,
     错相 standby=6*(k mod 6) */
time_interval_idle = [70,70,70,70]
time_interval_rampage = 1     /* 暴走逐帧相位驱动(见 Other_11) */

volley_counts = [6,7,8,9]
rampage_count = 10
track_perm_idle = 0.03
track_perm_rampage = 0.04

/* 伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkWingman)
   常态每发 = DPS×70帧/(60×2僚机×每波弹数[6,7,8,9])
   暴走每发 = 30×15帧/(60×2僚机×10弹) */
damages = [0.729167,0.8125,0.929688,0.972222,0.375]
type = 1

pend_k = []
pend_d = []
rtime = -1
rampage_prev = false

/* 品质弹体外观 */
StyleBullet = function(blt){
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.sprite_index = spr_bullet_player_annihilator_cd;
	blt.image_index = 1;
	Anim_Create(blt,"image_index",0,0,1,1,0,5);
	blt.tail_image = 3;
}

/* 原版 case_TYPE_FOLLOW 单弹发射: 初始锁敌=玩家上方1000px参考点最近敌(不含BOSS) */
FireAnnihilatorShot = function(k, rp){
	var base = rp ? -(8 + 10 * k) : -(5 + 10 * k);
	var ang = (dir = 0) ? base : 180 - base;

	var lx, ly;
	if(instance_exists(player)){
		lx = player.x;
		ly = player.y - 1000;
	}
	else{
		lx = equipment_agent.x;
		ly = equipment_agent.y - 1000;
	}
	var tgt = noone;
	var bd = 999999999;
	with(enemy_agent){
		if(object_index = boss_agent || object_is_ancestor(object_index, boss_agent))continue;
		if(inv_collision)continue;
		if(!point_in_rectangle(x, y, -60, -60, room_width + 60, room_height + 60))continue;
		var dd = point_distance(x, y, lx, ly);
		if(dd < bd){
			bd = dd;
			tgt = id;
		}
	}

	blt = MakePlayerBullet(x, y - 17, bullet_player_annihilator);
	blt.direction = ang;
	blt.image_angle = ang - 90;
	blt.damage = damage;
	blt.rampage = rp;
	blt.track_perm = rp ? track_perm_rampage : track_perm_idle;
	blt.init_v = 30;
	blt.track_inst = tgt;
	if(tgt != noone){
		blt.target_x = tgt.x;
		blt.target_y = tgt.y;
	}
	else{
		/* 原版 FOLLOW_TARGET_ID_FIXED_POS: 飞向固定点 */
		blt.target_x = lx;
		blt.target_y = ly;
	}
	StyleBullet(blt);
	blt.InitBezier();
}
