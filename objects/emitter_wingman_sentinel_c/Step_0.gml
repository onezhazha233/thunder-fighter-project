live;
event_inherited();

var master = noone;
var cnt = instance_number(object_index);
for(i=0;i<cnt;i+=1){
	var inst = instance_find(object_index,i);
	if(!instance_exists(master)){
		master = inst;
	} else if(inst.create_index < master.create_index){
		master = inst;
	} else if(inst.create_index == master.create_index&&inst.id < master.id){
		master = inst;
	}
}
var is_master = (instance_exists(master)&&id == master.id);

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		blt = MakePlayerBullet(x-sign(0.5-dir)*18*scale_x,y,bullet_player_wingman_sentinel);
		blt.colors = [[150,220,160],[60,150,40],[80,70,120]];
		blt.damage = damage;
	}
}
else{
	time = 0;
	if(instance_exists(laser)){
		instance_destroy(laser);
	}
	if(instance_exists(rampage_laser)){
		instance_destroy(rampage_laser);
	}
}

if(rampage = false){
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
			rampage_laser.image_xscale = lerp(0.9,0,ft);
		} 
	}else {
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
	block_inst.master_ref = master;
	with(block_inst)function OnBlock(){
		if(instance_exists(master_ref)){
			with(master_ref){
				if(block_count_cd = 0&&rampage = false){
					block_count += 1;
				}
			}
		}
	}
	array_push(follow_inst,[block_inst,0,0]);
}
else{
	if(instance_exists(master))block_inst.master_ref = master;
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

if(is_master){
	block_count_cd = max(0,block_count_cd-1);
	if(block_count >= block_demand){
		var event_level = block_level;
		block_count = 0;
		switch(block_level){
			case 0:
				block_count_cd = 8;
				break;
			case 1:
				block_count_cd = 8;
				break;
			case 2:
				block_count_cd = 36;
				break;
		}
		block_level += 1;
		if(block_level > 2)block_level = 0;
		block_tick += 1;
		block_event_level = event_level;
	}
	if(instance_exists(master)){
		with(emitter_wingman_sentinel_a){
			if(id != other.id){
				block_count = other.block_count;
				block_count_cd = other.block_count_cd;
				block_level = other.block_level;
			}
		}
	}
} else {
	if(instance_exists(master)){
		block_count = master.block_count;
		block_count_cd = master.block_count_cd;
		block_level = master.block_level;
	}
}

if(instance_exists(master)){
	if(block_event_seen != master.block_tick){
		block_event_seen = master.block_tick;
		ring = instance_create_depth(x,y,0,bullet_player_sentinel_ring);
		switch(master.block_event_level){
			case 0:
				ring.color = [50,172,56];
				break;
			case 1:
				ring.color = [193,141,22];
				break;
			case 2:
				ring.color = [55,106,154];
				laser = MakePlayerBullet(x,y,bullet_player_wingman_sentinel_laser);
				laser.image_angle = 90;
				laser.image_blend = make_color_rgb(100,150,255);
				laser.damage = damages[4];
				array_push(follow_inst,[laser,-sign(0.5-dir)*10*scale_x,-20]);
				break;
		}
		array_push(follow_inst,[ring,-10*sign(0.5-dir),-3]);
	}
}
