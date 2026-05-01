live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time > 0){
		if(rampage = false){
			if(bb <= weapon_level+3){
				if(dir = 0){
					a = MakePlayerBullet(x,y,bullet_player_wingman_guard);
					a.image_angle = -bb*10;
					a.direction = 90 - bb*10;
				}
				else{
					a = MakePlayerBullet(x,y,bullet_player_wingman_guard);
					a.image_angle = bb*10;
					a.direction = 90 + bb*10;
				}
				a.damage = damage;
			}
		}
		else{
			if(dir = 0){
				a = MakePlayerBullet(x,y,bullet_player_wingman_guard_rampage);
				a.image_angle = -bb*10;
				a.direction = 90 - bb*10;
			}
			else{
				a = MakePlayerBullet(x,y,bullet_player_wingman_guard_rampage);
				a.image_angle = bb*10;
				a.direction = 90 + bb*10;
			}
			a.damage = damage;
		}
		bb += 1;
	}
}
else{
	time = 0;
}

if!(instance_exists(block_inst)){
	block_inst = instance_create_depth(x,y,0,bullet_enemy_block);
	block_inst.image_xscale = block_width/2*scale_x;
	block_inst.image_yscale = block_height/2*scale_y;
	if(dir = 0)block_inst.x_offset = block_xoffset*scale_x;
	if(dir = 1)block_inst.x_offset = -block_xoffset*scale_x;
	block_inst.y_offset = block_yoffset*scale_y;
	array_push(follow_inst,block_inst);
}
else{
	if(rampage = false){
		block_inst.image_xscale += (block_width/2*scale_x - block_inst.image_xscale)/3;
		block_inst.image_yscale += (block_height/2*scale_y - block_inst.image_yscale)/3;
		if(dir = 0)block_inst.x_offset += (block_xoffset*scale_x - block_inst.x_offset)/3;
		if(dir = 1)block_inst.x_offset += (-block_xoffset*scale_x - block_inst.x_offset)/3;
		block_inst.y_offset += (block_yoffset*scale_y - block_inst.y_offset)/3;
	}
	else{
		block_inst.image_xscale += (block_width_rampage/2*scale_x - block_inst.image_xscale)/3;
		block_inst.image_yscale += (block_height_rampage/2*scale_y - block_inst.image_yscale)/3;
		if(dir = 0)block_inst.x_offset += (block_xoffset_rampage*scale_x - block_inst.x_offset)/3;
		if(dir = 1)block_inst.x_offset += (-block_xoffset_rampage*scale_x - block_inst.x_offset)/3;
		block_inst.y_offset += (block_yoffset_rampage*scale_y - block_inst.y_offset)/3;
	}
}
