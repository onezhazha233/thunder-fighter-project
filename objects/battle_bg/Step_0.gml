live;
// ===== 无缝循环背景层（bg_images 只含无缝层）=====
for(var i=0;i<array_length(bg_images);i+=1){
	bg_offset[i] += scroll_speed[i];

	if(bg_offset[i] >= bg_height[i]){
		bg_offset[i] -= bg_height[i];
	}
	else if(bg_offset[i] < 0){
		bg_offset[i] += bg_height[i];
	}
}

// ===== Part 图层（独立于 bg_images，实例渲染、不无缝）=====
// part 由 battle_bg_part 实例按间隔生成；生成位置始终在屏幕外上方再滑入，
// 因此 bg_part_repeat 切换（如 BOSS 战）不会导致 part 突然出现在画面中。
// 首次创建时先预铺一批 part，避免初始画面为空、要等很久才出现
if(!part_seeded){
	for(var p=0;p<array_length(part_sprite);p+=1){
		if(bg_part_repeat[p] = true) SeedPart(p);
	}
	part_seeded = true;
}

for(var p=0;p<array_length(part_sprite);p+=1){
	var _spr = part_sprite[p];
	if(_spr == noone || is_undefined(_spr)) continue;

	if(array_length(part_timer) <= p) part_timer[p] = 0;
	if(array_length(bg_part_repeat) <= p) bg_part_repeat[p] = true;

	if(bg_part_repeat[p] = true){
		part_timer[p] += 1;
		var _interval = part_interval[p];
		if(is_undefined(_interval)) _interval = 180;
		if(part_timer[p] >= _interval){
			SpawnPart(p);
			part_timer[p] = 0;
		}
	}
	// bg_part_repeat=false（BOSS 战）时暂停生成；已在屏上的 part 自然出屏，由 battle_bg_part 的 Other 事件销毁
}