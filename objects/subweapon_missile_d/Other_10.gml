live;
/* 原版常态: 4攻击点 由外到内 [45-135]@0 + [55-125]@3 + [65-115]@6 + [75-105]@9
   (原版为先外后内, 修正旧版先内后外的顺序) */
pend_a = [];
pend_d = [];
FireMissilePair(45, 135, false);
if(weapon_level > 0){
	array_push(pend_a, 55);
	array_push(pend_a, 125);
	array_push(pend_d, ap_delays[1]);
}
if(weapon_level > 1){
	array_push(pend_a, 65);
	array_push(pend_a, 115);
	array_push(pend_d, ap_delays[2]);
}
if(weapon_level > 2){
	array_push(pend_a, 75);
	array_push(pend_a, 105);
	array_push(pend_d, ap_delays[3]);
}
