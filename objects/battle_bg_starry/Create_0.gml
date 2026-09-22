live;
event_inherited();

bg_images = [[spr_bg_battle_starry]]
scroll_speed = [-1]
bg_height[0] = GetBgHeight(bg_images[0]);

part_sprite[0] = spr_bg_battle_starry_part_2;
part_speed[0] = 2;
part_interval[0] = 40*60;
// 注意: bg_part_offset 的单位是"帧", 而且父对象里会 mod part_interval,
// 它只能做循环内部的相位偏移, 不能用来推迟"首次出现"。
// (你写的 -4800 帧 = -2 × 2400 帧, mod 之后正好是 0, 所以和不写完全一样。)
bg_part_offset[0] = 0;
bg_part_repeat[0] = false;   // 先暂停这一层: 不预铺也不生成
part_delay = 40*60;          // 40 秒后再打开(见 Step_0)
part_func[0] = function(inst){
	inst.x -= 144;
	inst.image_xscale = 2;
	inst.image_yscale = 2;
}