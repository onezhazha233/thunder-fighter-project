live;
// ===== 首次出现延迟 =====
// Create 里把 bg_part_repeat[0] 设成 false(父对象的 Step 就不会预铺/生成),
// 这里计时到点后再打开; 顺手把 part_timer 顶到"差一帧就生成",
// 这样第一个 part 正好在 40.0 秒那一刻从屏幕上方滑入, 而不用再等一整个间隔。
if(part_delay > 0){
	part_delay -= 1;
	if(part_delay <= 0){
		bg_part_repeat[0] = true;
		part_timer[0] = part_interval[0] - 1;
	}
}

event_inherited();

if((instance_exists(battle_warning_boss)||instance_exists(boss_agent))&&bg_part_repeat[0] = true){
	for(var p=0;p<array_length(part_sprite);p+=1){
		bg_part_repeat[p] = false;
	}
}
if(!instance_exists(battle_warning_boss)&&!instance_exists(boss_agent)&&bg_part_repeat[0] = false){
	for(var p=0;p<array_length(part_sprite);p+=1){
		bg_part_repeat[p] = true;
	}
}