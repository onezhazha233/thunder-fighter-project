live;
/* 原版常态: 3攻击点 [45-135]@0 + [60-120]@5(等级1起) + [75-105]@10(等级2起) */
pend_a = [];
pend_d = [];
FireMissilePair(45, 135, false);
if(weapon_level > 0){
	array_push(pend_a, 60);
	array_push(pend_a, 120);
	array_push(pend_d, ap_delays[1]);
}
if(weapon_level > 1){
	array_push(pend_a, 75);
	array_push(pend_a, 105);
	array_push(pend_d, ap_delays[2]);
}
