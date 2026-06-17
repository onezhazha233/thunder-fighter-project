live;
if(burn_amount >= burn_target&&inv_burn = false){
	burn_amount = 0;
	SetBurn(burn_time);
}
if(burn_duration > 0){
	burn_amount = 0;
	effect_type = 1;
	effect_alpha += (0.2-effect_alpha)/2;
	var dmg = burn_damage;
	var now = time;
	ds_list_add(damage_history, [now, dmg]);
	if(floor(current_time/1000*game_get_speed(gamespeed_fps)) mod 5 = 0){
		for(i=0;i<irandom_range(1,3);i+=1){
			xx = random_range(bbox_left,bbox_right);
			yy = random_range(bbox_top,bbox_bottom);
			obj = asset_get_index("effect_enemy_fire_"+string(irandom(3)));
			ff = instance_create_depth(xx,yy,0,obj);
			ff.mark = id;
		}
	}
	if(burn_duration = burn_time){
		explode_amount += 1;
		if(explode_amount >= 70){
			explode_enabled = true;
			if(explode_time = 0){
				Anim_Create(id,"explode_interval",0,0,explode_interval,10-explode_interval,360);
			}
			if(explode_time >= explode_interval){
				explode_time = 0;
				scale_x = 1;
				scale_y = 1;
				type = 0;
				explode = MakePlayerBullet(clamp(explode_x,bbox_left,bbox_right),y,bullet_player_plane_falcon_explosion);
				explode.damage = explode_damage;
			}
			explode_time += 1;
		}
	}
	else{
		explode_amount = 0;
		explode_enabled = false;
		explode_time = 0;
		Anim_Destroy(id,"explode_interval");
		explode_interval = 45;
	}
	burn_duration -= 1;
}
if(burn_duration = 0){
	burn_duration = -1;
	Anim_Create(id,"effect_alpha",0,0,effect_alpha,-effect_alpha,10);
	Anim_Create(id,"effect_type",0,0,effect_type,-effect_type,0,10);
}