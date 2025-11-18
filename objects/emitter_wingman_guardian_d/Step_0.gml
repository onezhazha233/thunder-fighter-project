live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time > 0){
		if(rampage = false){
			if(bb <= weapon_level+3){
				if(dir = 0){
					a = MakePlayerBullet(x,y,bullet_player_wingman_guardian);
					a.image_angle = -bb*10;
					a.direction = 90 - bb*10;
				}
				else{
					a = MakePlayerBullet(x,y,bullet_player_wingman_guardian);
					a.image_angle = bb*10;
					a.direction = 90 + bb*10;
				}
				a.damage = damage;
			}
		}
		else{
			if(dir = 0){
				a = MakePlayerBullet(x,y,bullet_player_wingman_guardian_rampage);
				a.image_angle = -bb*10;
				a.direction = 90 - bb*10;
			}
			else{
				a = MakePlayerBullet(x,y,bullet_player_wingman_guardian_rampage);
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
	block_inst.image_xscale = block_width/2;
	block_inst.image_yscale = block_height/2;
	if(dir = 0)block_inst.x_offset = block_xoffset;
	if(dir = 1)block_inst.x_offset = -block_xoffset;
	block_inst.y_offset = -block_yoffset;
	array_push(follow_inst,block_inst);
}
else{
	if(rampage = false){
		block_inst.image_xscale += (block_width/2 - block_inst.image_xscale)/3;
		block_inst.image_yscale += (block_height/2 - block_inst.image_yscale)/3;
		if(dir = 0)block_inst.x_offset += (block_xoffset - block_inst.x_offset)/3;
		if(dir = 1)block_inst.x_offset += (-block_xoffset - block_inst.x_offset)/3;
		block_inst.y_offset += (block_yoffset - block_inst.y_offset)/3;
	}
	else{
		block_inst.image_xscale += (block_width_rampage/2 - block_inst.image_xscale)/3;
		block_inst.image_yscale += (block_height_rampage/2 - block_inst.image_yscale)/3;
		if(dir = 0)block_inst.x_offset += (block_xoffset_rampage - block_inst.x_offset)/3;
		if(dir = 1)block_inst.x_offset += (-block_xoffset_rampage - block_inst.x_offset)/3;
		block_inst.y_offset += (block_yoffset_rampage - block_inst.y_offset)/3;
	}
}