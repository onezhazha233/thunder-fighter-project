live;
depth = DEPTH_BATTLE.BG
// 初始化背景图像、滚动速度、y轴偏移
bg_images = []; // 将 spr_background 替换为你的背景图资源名
scroll_speed = -3; // 可为负数表示向上滚动
bg_offset = 0;

DrawBg = function(yy){
	yyy = yy;
	for(i=0;i<array_length(bg_images);i+=1){
		if(i > 0){
			yyy += sprite_get_height(bg_images[i-1]);
		}
		draw_sprite(bg_images[i],0,0,yyy);
	}
}
GetBgHeight = function(){
	hh = 0;
	for(i=0;i<array_length(bg_images);i+=1){
		hh += sprite_get_height(bg_images[i]);
	}
	return hh;
}