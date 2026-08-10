live;
image_angle += rotate

custom_function()

// ===== 粗筛 1：离屏处理（移动已在上方完成，此处跳过碰撞+宽限回收，折返子弹有回屏机会；cull_margin=0 可关闭） =====
if(cull_margin > 0 && instance_exists(camera)){
	var _cull_vx = camera.x + camera._shake_pos_x - cull_margin;
	var _cull_vy = camera.y + camera._shake_pos_y - cull_margin;
	var _cull_w = (camera.width/camera.scale_x) + cull_margin*2;
	var _cull_h = (camera.height/camera.scale_y) + cull_margin*2;
	if(!point_in_rectangle(x,y,_cull_vx,_cull_vy,_cull_vx+_cull_w,_cull_vy+_cull_h)&&auto_destroy = true){
		// 已离屏：进入宽限倒计时，满宽限仍未回屏才销毁
		if(auto_destroy_time < 0){
			cull_grace_timer = auto_destroy_delay;
		}
		else{
			auto_destroy_time -= 1;
			if(auto_destroy_time <= 0){
				destroy_type = 3;
				instance_destroy();
			}
		}
		// 离屏时跳过本帧碰撞检测（折返子弹仍能继续移动回屏）
		exit;
	}
	else{
		// 回到屏内：重置宽限
		auto_destroy_time = -1;
	}
}

// ===== 粗筛 2：玩家距离预判（按实际碰撞盒计算，兼容大缩放子弹） =====
var _pm = 64;//玩家判定安全余量
var _bw = _pm*2;
var _bh = _pm*2;
if(sprite_exists(sprite_index)){
	_bw = max(abs(bbox_left-x),abs(bbox_right-x)) + _pm;
	_bh = max(abs(bbox_top-y),abs(bbox_bottom-y)) + _pm;
}
var _near_player = instance_exists(player) && (abs(x-player.x) <= _bw && abs(y-player.y) <= _bh);

if(hp <= 0){
	if(inv_damage = false){
		destroy_type = 5;
		instance_destroy();
	}
}

if(inv_collision = false&&Player_IsEnabled()){
	if!(Player_IsBreaktime()){
		if(_near_player && place_meeting(x,y,player)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				event_user(1);
				Player_CallHurtEvent();
				if(collision_destroy = true){
					destroy_type = 2;
					instance_destroy();
				}
			}
		}
	}
}

if(inv_block = false){
	blk = instance_place(x,y,bullet_enemy_block);
	if(instance_exists(blk)){
		destroy_type = blk.type;
		blk.OnBlock();
		instance_destroy();
	}
}

if(ds_exists(tracks,ds_type_map)){
	var _keys = ds_map_find_first(tracks);
	while (!is_undefined(_keys)) {
		var num = ds_map_find_value(tracks, _keys);
		var _next_key = ds_map_find_next(tracks, _keys);
		if (num <= 0){
		    ds_map_delete(tracks, _keys);
		}
		_keys = _next_key;
	}
}

duration -= 1
if(duration = 0){
	destroy_type = 3;
	instance_destroy();
}
