image_angle += rotate

custom_function()

duration -= 1
if(duration = 0){
	destroy_type = 3;
	instance_destroy();
}

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

if(Player_IsEnabled()){
	if(global.inv_hurt = 0&&global.inv_shield = 0&&!Player_IsBreaktime()){
			// ===== 粗筛 2：按子弹实际碰撞范围计算预判边界（兼容大缩放子弹），与玩家距离足够远才跳过 =====
			var _pm = 64;//玩家判定安全余量(玩家命中框16x16，半宽仅8px，64px留足余量)
			var _bw, _bh;
			if(collision_mask_enabled = true){
				// 精灵遮罩：用世界包围盒(已含缩放/旋转)
				if(sprite_exists(sprite_index)){
					_bw = max(abs(bbox_left-x),abs(bbox_right-x)) + _pm;
					_bh = max(abs(bbox_top-y),abs(bbox_bottom-y)) + _pm;
				}
				else{
					_bw = _pm*2;
					_bh = _pm*2;
				}
			}
			else{
				switch(collision_mask_type){
					case 0:
						_bw = max(abs(left*scale_x),abs(right*scale_x)) + _pm;
						_bh = max(abs(up*scale_y),abs(down*scale_y)) + _pm;
						break;
					case 1:
						_bw = abs(radius*scale_x) + _pm;
						_bh = abs(radius*scale_y) + _pm;
						break;
					default:
						_bw = _pm*2;
						_bh = _pm*2;
						break;
				}
			}
			if(abs(x-player.x) <= _bw && abs(y-player.y) <= _bh){
				if(collision_mask_enabled = true){
					if(place_meeting(x,y,player)){
						event_user(0);
						Player_CallHurtEvent();
						if(collision_destroy = true){
							instance_destroy();
						}
					}
				}
				else{
					switch(collision_mask_type){
						case 0:
							player_point = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,player,0,1);
							if!(player_point = noone){
								event_user(0);
								Player_CallHurtEvent();
								if(collision_destroy = true){
									instance_destroy();
								}
							}
							break;
						case 1:
							player_point = collision_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,player,0,1);
							if!(player_point = noone){
								event_user(0);
								Player_CallHurtEvent();
								if(collision_destroy = true){
									instance_destroy();
								}
							}
							break;
					}
				}
			}
		}
	}

if(collision_mask_enabled = true){
	blk = instance_place(x,y,bullet_enemy_block);
	if(instance_exists(blk)){
		destroy_type = blk.type;
		blk.OnBlock();
		instance_destroy();
	}
}
else{
	switch(collision_mask_type){
		case 0:
			blk = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,bullet_enemy_block,0,1);
			if(instance_exists(blk)){
				destroy_type = blk.type;
				blk.OnBlock();
				instance_destroy();
			}
			break;
		case 1:
			blk = collision_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,bullet_enemy_block,0,1);
			if(instance_exists(blk)){
				destroy_type = blk.type;
				blk.OnBlock();
				instance_destroy();
			}
			break;
	}
}