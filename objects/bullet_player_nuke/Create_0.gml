live;
event_inherited();

idle = seq_nuke_a

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_player_nuke_explosion
collision_effect_sequence = seq_nuke_a_explosion
collision_effect_duration = 10
collision_effect_radius = 80

duration = 68

// ---- standby: 数学公式驱动，不依赖 Anim ----
standby_active = false
standby_t = 0
standby_T = 0
standby_W = 0
standby_dir = 1
standby_x0 = 0
standby_y0 = 0
standby_drop = 56.25
standby_v = -22.5

SetStandby = function(_T, _W, _v){
	standby_active = true;
	standby_t = 0;
	standby_T = _T;
	standby_W = abs(_W);
	standby_dir = sign(_W);
	standby_v = _v;
	standby_x0 = x;
	standby_y0 = y;
	hspeed = 0;
	vspeed = 0;
}

CycleStandby = function(){
	if (!standby_active) return false;
	standby_t++;
	var _r = sqrt(standby_t / standby_T);
	x = standby_x0 + standby_dir * standby_W * _r;
	y = standby_y0 + standby_drop * _r;
	hspeed = 0;
	vspeed = 0;
	if (standby_t >= standby_T){
		standby_active = false;
	}
	return true;
}

function CollideSingleEnemy(enemy){
	instance_destroy();
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.bullet_sequence = collision_effect_sequence;
	effect.duration = collision_effect_duration;
	effect.radius = collision_effect_radius;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
	effect.damage = damage;
}