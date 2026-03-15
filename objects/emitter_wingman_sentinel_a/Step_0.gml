live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		blt = MakePlayerBullet(x-sign(0.5-dir)*18*scale_x,y,bullet_player_wingman_sentinel);
		blt.damage = damage;
	}
}
else{
	time = 0;
}

if(rampage == true){
	if(!instance_exists(rampage_laser)){
		rampage_laser = MakePlayerBullet(x,y,bullet_player_wingman_sentinel_laser);
		rampage_laser.image_angle = 90;
		rampage_laser.duration = 999999;
		rampage_laser.image_blend = make_color_rgb(1610,220,160);
		rampage_laser.wave_time = 0;
		rampage_laser.fade_out = false;
		rampage_laser.fade_time = 0;
		Anim_Destroy(rampage_laser,"image_xscale");
		array_push(follow_inst,[rampage_laser,-sign(0.5-dir)*18*scale_x,-30]);
	}
	if(instance_exists(rampage_laser)){
		if!(rampage_laser.fade_out){
			rampage_laser.wave_time += 1;
			if(rampage_laser.wave_time <= 6){
				rampage_laser.image_xscale = rampage_laser.wave_time/6;
			} else {
				var wt = (rampage_laser.wave_time-6)/10;
				rampage_laser.image_xscale = 0.7 + 0.1*sin(wt*2*pi);
			}
		}
	}
} else {
	if(instance_exists(rampage_laser)){
		if(!rampage_laser.fade_out){
			rampage_laser.fade_out = true;
			rampage_laser.fade_time = 0;
			rampage_laser.duration = 6;
			Anim_Destroy(rampage_laser,"image_xscale");
		}
		if(rampage_laser.fade_out){
			rampage_laser.fade_time += 1;
			var ft = min(rampage_laser.fade_time/6,1);
			rampage_laser.image_xscale = lerp(0.8,0,ft);
		} 
	} else {
		rampage_laser = noone;
	}
}
if!(instance_exists(block_inst)){
	block_inst = instance_create_depth(x,y,0,bullet_enemy_block);
	block_inst.image_xscale = block_width/2;
	block_inst.image_yscale = block_height/2;
	block_inst.mark = id;
	if(dir = 0)block_inst.x_offset = block_xoffset;
	if(dir = 1)block_inst.x_offset = -block_xoffset;
	block_inst.y_offset = -block_yoffset;
	with(block_inst)function OnBlock(){
		if(mark.block_count_cd = 0&&mark.rampage = false){
			mark.block_count += 1;
		}
	}
	array_push(follow_inst,[block_inst,0,0]);
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

block_count_cd = max(0,block_count_cd-1)
if(block_count > block_demand){
	block_count = 0;
	ring = instance_create_depth(x,y,0,bullet_player_sentinel_ring);
	switch(block_level){
		case 0:
			block_count_cd = 8;
			ring.color = [50,172,56];
			break;
		case 1:
			block_count_cd = 8;
			ring.color = [193,141,22];
			break;
		case 2:
			block_count_cd = 36;
			ring.color = [55,106,154];
			laser = MakePlayerBullet(x,y,bullet_player_wingman_sentinel_laser);
			laser.image_angle = 90;
			laser.duration = 36;
			laser.image_blend = make_color_rgb(1610,220,160);
			Anim_Create(laser,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,8,6);
			for(i=0;i<2;i+=1){
				Anim_Create(laser,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0.8,-0.1,5,6+i*10);
				Anim_Create(laser,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0.7,0.1,5,6+i*10+5);
			}
			Anim_Create(laser,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN,0.8,-0.8,10,26);
			array_push(follow_inst,[laser,-sign(0.5-dir)*10*scale_x,-20]);
			break;
	}
	block_level += 1;
	if(block_level > 2)block_level = 0;
	array_push(follow_inst,[ring,-10*sign(0.5-dir),-3]);
}
