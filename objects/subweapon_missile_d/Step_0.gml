live;
event_inherited();

/* 原版攻击点错相: 待发队列逐帧倒计时(模式切换清空) */
if(rampage != rampage_prev){
	rampage_prev = rampage;
	pend_a = [];
	pend_d = [];
}

if(enabled = true){
	var na = [];
	var nd = [];
	for(var i = 0; i < array_length(pend_d); i += 1){
		if(pend_d[i] <= 0){
			FireMissilePair(pend_a[2*i], pend_a[2*i+1], rampage);
		}
		else{
			pend_d[i] -= 1;
			array_push(na, pend_a[2*i]);
			array_push(na, pend_a[2*i+1]);
			array_push(nd, pend_d[i]);
		}
	}
	pend_a = na;
	pend_d = nd;
}
else{
	pend_a = [];
	pend_d = [];
}
