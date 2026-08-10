live;
event_inherited();

bg_images = [[spr_bg_battle_core]]
scroll_speed = [-3]
bg_offset = [0]
bg_height[0] = GetBgHeight(bg_images[0]);

// ===== Part 图层（独立于 bg_images，实例渲染、不无缝）=====
// part 由 bg 按间隔在屏幕外上方生成、高速下滑；出屏后由 battle_bg_part 的 Other 事件销毁。
// part_speed 为向下速度；part_interval 越小同屏实例越多（列越密）。
// bg_part_offset 为该层生成相位的时间偏移（帧，random；等效于循环带子向前/向后错位）。
part_sprite[0] = spr_bg_battle_core_part_0;
part_speed[0] = 6.7;
part_interval[0] = 300;
bg_part_offset[0] = random(1000);

part_sprite[1] = spr_bg_battle_core_part_1;
part_speed[1] = 5;
part_interval[1] = 400;
bg_part_offset[1] = random(1000);

part_sprite[2] = spr_bg_battle_core_part_2;
part_speed[2] = 3.8;
part_interval[2] = 420;
bg_part_offset[2] = random(1000);

part_sprite[3] = spr_bg_battle_core_part_3;
part_speed[3] = 4.5;
part_interval[3] = 380;
bg_part_offset[3] = random(1000);
