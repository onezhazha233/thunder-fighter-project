live;
/* 常态波开始(每70帧): 弹k错相 standby = 6*(k mod 4), 相位0的弹立即发射 */
pend_k = [];
pend_d = [];
for(var k = 0; k < volley_counts[weapon_level]; k += 1){
	var d = 6 * (k mod 4);
	if(d = 0){
		FireAnnihilatorShot(k, false);
	}
	else{
		array_push(pend_k, k);
		array_push(pend_d, d);
	}
}
