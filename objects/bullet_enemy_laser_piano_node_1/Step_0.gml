live;
time += 1;
if(state = 0){
	ring_angle += 4;
	if(time = 1){
		Anim_Create(id,"ring_alpha",0,0,0,1,20);
		Anim_Create(id,"ring_scale",ANIM_TWEEN.SINE,ANIM_EASE.OUT,ring_scale,1-ring_scale,20);
		Anim_Create(id,"ring_logo_alpha",0,0,0,1,20);
	}
	ring_logo_scale = 1.05 + sin(time/2)*0.05;
	if(time = 20+delay){
		state = 1;
		time = 0;
	}
}
if(state = 1){
	ring_angle += 4;
	if(time = 1){
		Anim_Create(id,"ring_alpha",0,0,1,-1,10);
		Anim_Create(id,"ring_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,ring_scale,1.5-ring_scale,30);
		Anim_Create(id,"ring_logo_alpha",0,0,1,-1,10);
		Anim_Create(id,"ring_logo_scale",0,0,ring_logo_scale,-ring_logo_scale,30);
	}
	if(time = 10){
		state = 2;
		time = 0;
	}
}
if(state = 2){
	if(time = 1){
		Anim_Create(id,"node_1_alpha",0,0,0,1,20);
		Anim_Create(id,"node_1_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,node_1_scale,1-node_1_scale,20);
	}
	if(time = 20){
		collision_enabled = true;
		Anim_Create(id,"node_0_alpha",0,0,0,1,20);
	}
	if(time = 30){
		Anim_Create(id,"node_1_alpha",0,0,1,-1,10);
	}
	if(time = 40){
		Anim_Create(id,"node_bottom_dist",ANIM_TWEEN.BACK,ANIM_EASE.OUT,0,40,20);
	}
	if(time = 45){
		blk = instance_create_depth(x,y,0,bullet_enemy_block);
		blk.sprite_index = mask_index;
		Anim_Create(id,"redlight_alpha",0,0,0,1,10);
		Anim_Create(id,"redlight_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,redlight_scale,1.5-redlight_scale,10);
		Anim_Create(id,"redlight_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1.5,-0.5,10,10);
		Anim_Create(id,"node_trangle_0_alpha",0,0,0,1,10);
		accept_laser = 1;
	}
	if(time = 65){
		state = 3;
		time = 0;
	}
}
if(state = 3){
	duration -= 1;
	if(time mod 40 = 1){
		node_trangle_1_alpha = 1;
		Anim_Create(id,"node_trangle_1_scale",0,0,0,1,40);
		Anim_Create(id,"node_trangle_1_alpha",0,0,1,-1,5,35);
	}
	if(duration = 0){
		state = 4;
		time = 0;
		accept_laser = 0;
	}
}
if(state = 4){
	if(time = 1){
		Anim_Create(id,"redlight_alpha",0,0,1,-1,10);
		node_part = 0;
		Anim_Create(id,"node_1_alpha",0,0,0,1,10);
		Anim_Create(id,"node_0_alpha",0,0,1,-1,20);
		for(i=0;i<3;i+=1){
			Anim_Create(id,"node_1_alpha",0,0,1,-0.5,10,i*20);
			Anim_Create(id,"node_1_alpha",0,0,0.5,0.5,10,i*20+10);
		}
		Anim_Create(id,"node_1_alpha",0,0,1,-1,10,60);
	}
	if(time = 30){
		instance_destroy(blk);
		collision_enabled = false;
	}
	if(time = 70){
		destroy_type = 3;
		instance_destroy();
	}
}
if(instance_exists(blk)){
	blk.x = x;
	blk.y = y;
}

if(Player_IsEnabled()&&collision_enabled = true){
	if(global.inv_hurt = 0&&global.inv_shield = 0&&!Player_IsBreaktime()){
		if(collision_mask_enabled = true){
			if(place_meeting(x,y,player)){
				event_user(0);
				Player_CallHurtEvent();
				if(collision_destroy = true){
					instance_destroy();
				}
			}
		}
	}
}

if(instance_exists(mark)){
	if(mark.GetFrozen() > 0){
		if(state < 4){
			accept_laser = 0;
			state = 4;
			time = 0;
		}
	}
}