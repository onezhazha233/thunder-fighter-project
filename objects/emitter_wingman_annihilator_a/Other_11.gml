live;
rtime += 1
/* 原版暴走: rampage_count 个攻击点各15帧周期, 一次性错相 standby = 6*(k mod 6) */
for(var k = 0; k < rampage_count; k += 1){
	var st = 6 * (k mod 6);
	if(rtime >= st && (rtime - st) mod 15 = 0){
		FireAnnihilatorShot(k, true);
	}
}
