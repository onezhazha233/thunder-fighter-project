live;
event_inherited();

/* 原版 setCurWeapon: 模式切换时攻击点重建(错相重启, 未完成波清空) */
if(rampage != rampage_prev){
	rampage_prev = rampage;
	rtime = -1;
	pend_k = [];
	pend_d = [];
}

if(rampage = false && enabled = true){
	/* 常态波内错相: 弹k在波开始后 6*(k mod 4) 帧发射(原版 standbyTime 序列) */
	var nk = [];
	var nd = [];
	for(var i = 0; i < array_length(pend_d); i += 1){
		if(pend_d[i] = 0){
			FireAnnihilatorShot(pend_k[i], false);
		}
		else{
			pend_d[i] -= 1;
			array_push(nk, pend_k[i]);
			array_push(nd, pend_d[i]);
		}
	}
	pend_k = nk;
	pend_d = nd;
}
else if(enabled = false){
	pend_k = [];
	pend_d = [];
}
