live;
depth = DEPTH_BATTLE.BG
// 初始化背景图像、滚动速度、y轴偏移
bg_images = []; // 背景图资源
scroll_speed = [-3]; // 可为负数表示向上滚动
bg_offset = [0];
bg_height = []

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