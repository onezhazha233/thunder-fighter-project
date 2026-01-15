live;
var _len = array_length(graze_effects);

for (var i = 0; i < _len; i++) {
	draw_set_colour(c_white)
	
    var _e = graze_effects[i];
        
    // --- 计算衰减比率 ---
    // 结果从 1.0 (刚出生) 变成 0.0 (死亡)
    var _ratio = _e.life / _e.max_life;
        
    draw_sprite_ext(
        spr_effect_graze, // 你的特效贴图
        0,                // 子图像索引
        player.x+_e.lx,          // X
        player.y+_e.ly,          // Y
        _ratio/2+0.5,           // X缩放 (随寿命变小)
        _ratio/2+0.5,           // Y缩放 (随寿命变小)
        0,                // 旋转 (可存 _e.angle)
        c_white,          // 颜色
        _ratio            // 透明度 (随寿命变淡)
    );
}

for (var i = array_length(graze_effects) - 1; i >= 0; i--) {
    var _e = graze_effects[i];
    
    // 1. 更新相对位置 (让粒子向四周扩散)
    _e.lx += _e.hsp;
    _e.ly += _e.vsp;
    
    // 2. 扣除寿命
    _e.life -= 1;
    
    // 3. 死亡清理
    if (_e.life <= 0) {
        // [优化] 将当前死亡的粒子与数组最后一个交换，然后删掉最后一个
        // 这比 array_delete 快得多
        graze_effects[i] = graze_effects[array_length(graze_effects) - 1];
        array_pop(graze_effects);
    }
}

for(var i=0;i<array_length(graze_ratings);i+=1){
	var rt = graze_ratings[i];
	rt.duration -= 1;
	
	draw_sprite_ext(spr_effect_graze_rating,rt.image,player.x+rt.ox,player.y+rt.oy,1,1,0,-1,rt.alpha);

	if(rt.duration <= 0){
		array_delete(graze_ratings,i,1);
	}
}

draw_set_colour(-1)
draw_text(0,900,graze_amount)