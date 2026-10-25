live;
/* 原版常态: 主攻击点[45-135]立即, 副攻击点[70-110]延迟6帧(等级0无副攻击点) */
pend_a = [];
pend_d = [];
FireMissilePair(45, 135, false);
if(weapon_level > 0){
	array_push(pend_a, 70);
	array_push(pend_a, 110);
	array_push(pend_d, ap_delays[1]);
}
