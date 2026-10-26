live;
event_inherited();

idle = seq_armor_piercer_a

collision_type = COLLISION_TYPE.SPRITE

collision_destroy = false

collision_effect = seq_bullet_effect_armor_piercer_a

damage_type = 0

ospd = 0
time = 0

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
	ospd = _v;
	hspeed = 0;
	vspeed = 0;
}
h = 0

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
		ospd = standby_v;
	}
	return true;
}

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	MakeEffect(x,y+(-30+(time mod 4)*12)*scale_y,collision_effect,scale_x,scale_y);
	time += 1;
}