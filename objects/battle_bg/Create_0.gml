live;
depth = DEPTH_BATTLE.BG
// 初始化背景图像、滚动速度、y轴偏移
bg_images = []; // 背景图资源
scroll_speed = [-3]; // 可为负数表示向上滚动
bg_offset = [0];
bg_height = []
bg_part_repeat = array_create(10,true)

// ===== Part 图层（独立于 bg_images，只做实例渲染、不无缝）=====
// bg_images 只负责无缝循环的背景；part 是独立列表，按自身索引配置。
// part_sprite[p]   : part 使用的精灵
// part_speed[p]    : part 下落速度（正=向下）
// part_interval[p] : part 生成间隔（帧）
// bg_part_repeat[p]: part 是否循环生成（默认 true；BOSS 战置 false 暂停）
// bg_part_offset[p]: part 生成相位的时间偏移（帧，可正可负；等效于循环带子向前/向后偏移的帧数）
part_sprite = [];
part_speed = [];
part_interval = [];
part_timer = [];
bg_part_offset = [];
part_seeded = false; // 是否已在创建时预铺一批 part

// 返回该 part 的时间相位偏移（帧，0 ≤ 偏移 < 间隔），等效于循环带子向前/向后随机偏移的帧数；
// 负值（向后）会归一到 [0, 间隔) 内；初始 part_timer 也用该值初始化
FrameOffset = function(p){
	var _off = bg_part_offset[p];
	if(is_undefined(_off)) return 0;
	var _int = part_interval[p];
	if(is_undefined(_int)) _int = 180;
	if(_int <= 0) _int = 1;
	var _fo = _off mod _int;
	if(_fo < 0) _fo += _int;
	return _fo;
}

// 在指定上缘位置生成一个 part 实例并让其高速下滑；返回该实例
// _top 为该 part 的上缘 y（默认 -_h，完全在屏幕外上方，从边缘滑入）；x=0（左缘）
SpawnPart = function(p, _top=undefined){
	var _spr = part_sprite[p];
	if(_spr == noone || is_undefined(_spr)) return noone;
	var _h = sprite_get_height(_spr);
	var _oy = sprite_get_yoffset(_spr);
	var _spd = part_speed[p];
	if(is_undefined(_spd)) _spd = 10;
	if(is_undefined(_top)) _top = -_h;
	// 用 vspeed 驱动下滑
	var _p = instance_create_depth(0, _top + _oy, DEPTH_BATTLE.BG-10, battle_bg_part);
	_p.sprite_index = _spr;
	_p.image_speed = 0;
	_p.vspeed = _spd;
	return _p;
}

// 创建时把该 part 的一列实例预铺好（间距 = 速度×间隔），让画面初始就有 part；
// 起始位置由时间相位偏移折算（偏移帧数×速度），并把该帧数写入初始 part_timer
SeedPart = function(p){
	var _spr = part_sprite[p];
	if(_spr == noone || is_undefined(_spr)) return;
	var _h = sprite_get_height(_spr);
	var _spd = part_speed[p];
	if(is_undefined(_spd)) _spd = 10;
	var _int = part_interval[p];
	if(is_undefined(_int)) _int = 180;
	var _gap = _spd * _int;
	if(_gap <= 0) _gap = _h; // 防止死循环
	var _fo = FrameOffset(p);
	part_timer[p] = _fo;          // 初始时间计数 = 随机帧偏移
	var _top = -_h + _fo * _spd;  // 帧偏移等效的位置偏移
	while(_top > 0) _top -= _gap; // 若起点已入画则回退到屏幕外上方
	while(_top < room_height + _h){
		SpawnPart(p, _top);
		_top += _gap;
	}
}

DrawBg = function(yy,images){
	yyy = yy;
	for(var i=0;i<array_length(images);i+=1){
		if(i > 0){
			yyy += sprite_get_height(images[i-1]);
		}
		draw_sprite(images[i],0,0,yyy);
	}
}
GetBgHeight = function(images){
	hh = 0;
	for(var i=0;i<array_length(images);i+=1){
		hh += sprite_get_height(images[i]);
	}
	return hh;
}