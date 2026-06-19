live;
//lotus shield
depth = 250

light_alpha = 0
item_count = 0
attack_up = 0
attack_addition = 0.1
lotus_rampage_previous = 0

ArmorAbility = function(type,exarg=0){
	if(type = 0){
		if(Player_GetRampage() <= 0&&lotus_rampage_previous > 0){
			attack_up = 0;
		}
		if(Player_GetRampage() > 0&&lotus_rampage_previous <= 0&&item_count = 5&&attack_up = 0){
			attack_up = 1;
			item_count = 0;
			with(effect_lotus){
				if(mode = 0)instance_destroy();
			}
			eff = instance_create_depth(0,0,0,effect_lotus);
			eff.SetSequence(6);
		}
		lotus_rampage_previous = Player_GetRampage();
	}
	if(type = 1){
		return exarg;
	}
	if(type = 4){
		if(item_count >= 5){
			with(effect_lotus){
				if(mode = 0)instance_destroy();
			}
			if(Player_GetRampage() > 0&&attack_up = 0){
				attack_up = 1;
				item_count = 0;
				eff = instance_create_depth(0,0,0,effect_lotus);
				eff.SetSequence(6);
			}
			else{
				eff = instance_create_depth(0,0,0,effect_lotus);
				eff.SetSequence(5);
			}
		}
		else{
			var _next = item_count+1;
			if(_next = 5&&Player_GetRampage() > 0&&attack_up = 0){
				attack_up = 1;
				item_count = 0;
				with(effect_lotus){
					if(mode = 0)instance_destroy();
				}
				eff = instance_create_depth(0,0,0,effect_lotus);
				eff.SetSequence(6);
			}
			else{
				SetItemCount(_next);
			}
		}
	}
}

SetItemCount = function(c){
	item_count = c;
	with(effect_lotus){
		if(mode = 0)instance_destroy();
	}
	eff = instance_create_depth(0,0,0,effect_lotus);
	eff.SetSequence(c-1);
}

if(room = room_battle){
	var _armor = id;
	buff_lotus = {
		armor_inst: _armor,
		atkbonus: {value: 0},
		icon_scale: 0.2,
		icon_alpha: 0,
		is_active: false,
		attack_up_previous: 0,
		step: function(){
			var _up = armor_inst.attack_up;
			if(_up = 1){
				if(attack_up_previous <= 0){
					atkbonus.value = armor_inst.attack_addition;
					if(!(array_contains(global.atk_all_bonus,atkbonus))){
						array_push(global.atk_all_bonus,atkbonus);
					}
					Anim_Destroy(self, "icon_scale");
					Anim_Destroy(self, "icon_alpha");
					Anim_Create(self, "icon_scale", ANIM_TWEEN.BACK, ANIM_EASE.OUT, 0.2, 0.8, 8);
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0, 1, 4);
					is_active = true;
				}
			}
			else{
				if(attack_up_previous > 0){
					atkbonus.value = 0;
					for(var i=0;i<array_length(global.atk_all_bonus);i+=1){
						if(global.atk_all_bonus[i] = atkbonus){
							array_delete(global.atk_all_bonus,i,1);
							break;
						}
					}
					Anim_Destroy(self, "icon_scale");
					Anim_Destroy(self, "icon_alpha");
					icon_scale = 1;
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 1, -0.7, 6, 0);
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0.3, 0.5, 6, 6);
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0.8, -0.6, 6, 12);
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0.2, 0.4, 6, 18);
					Anim_Create(self, "icon_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0.6, -0.6, 6, 24,
						method(self, function(){is_active = false;}));
				}
			}
			attack_up_previous = _up;
		},
		draw: function(xx,yy){
			if(!(is_active)&&icon_alpha <= 0)return;
			draw_sprite_ext(spr_buff_lotus,0,xx,yy,icon_scale,icon_scale,0,-1,icon_alpha);
		}
	}

	ds_list_add(battle_ui.buff_list,buff_lotus);
}