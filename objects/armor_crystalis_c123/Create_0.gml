live;
//crystalis bastion +1/2/3
ArmorAbility = function(type,exarg=0){
	if(type = 0){
		
	}
	if(type = 1){
		return exarg;
	}
}

if(room = room_battle){
	buff_crystalis = {
		surf: surface_create(64,64),
		atkpower: 0,
		atkpower_spd: 100/(60*2.5),
		atkpower_level: 0,
		atkpower_level_max: 5,
		atkbonus: {value: 0},
		atkbonus_fadetime: 0,
		rampage_previous: 0,
		icon_alpha: 0,
		step: function(){
			if(Player_GetRampage() > 0){
				if(rampage_previous <= 0){
					if(atkpower_level = atkpower_level_max){
						atkpower = 100;
					}
					atkbonus_fadetime = 0;
					if(array_contains(global.atk_all_bonus,atkbonus)){
						for(i=0;i<array_length(global.atk_all_bonus);i+=1){
							if(global.atk_all_bonus[i] = atkbonus){
								array_delete(global.atk_all_bonus,i,1);
								break;
							}
						}
					}
				}
				if(atkpower_level < atkpower_level_max){
					if(atkpower >= 100){
						atkpower_level += 1;
						instance_create_depth(0,0,0,effect_crystalis).mode = 0;
						if(atkpower_level < atkpower_level_max){
							atkpower = 0;
						}
						else{
							atkpower = 100;
						}
					}
					if(Player_IsEnabled())if(player.equipment.enabled = true)atkpower += atkpower_spd;
				}
			}
			else{
				if(rampage_previous > 0){
					if(atkpower_level = 0){
						atkpower = 0;
					}
					atkbonus.value = floor(atkpower_level)*0.15;
					if!(array_contains(global.atk_all_bonus,atkbonus)){
						array_push(global.atk_all_bonus,atkbonus);
					}
					atkpower = 0;
					atkbonus_fadetime = 0;
					if(atkpower_level > 0){
						instance_create_depth(0,0,0,effect_crystalis).mode = 1;
					}
				}
				if(atkpower_level > 0){
					if(Player_IsEnabled())if(player.equipment.enabled = true)atkbonus_fadetime += 1;
					if(atkbonus_fadetime >= 300){
						atkpower_level -= 1;
						atkbonus.value = 0.15*atkpower_level;
						if(atkpower_level <= 0){
							for(i=0;i<array_length(global.atk_all_bonus);i+=1){
								if(global.atk_all_bonus[i] = atkbonus){
									array_delete(global.atk_all_bonus,i,1);
									atkpower = 0;
									break;
								}
							}
						}
						else{
							atkbonus_fadetime = 0;
						}
					}
				}
			}
			if(Player_GetRampage() <= 0&&atkbonus.value > 0){
				icon_alpha += (1-icon_alpha)/5;
			}
			else{
				icon_alpha += (0-icon_alpha)/5;
			}
			rampage_previous = Player_GetRampage();
		},
		draw: function(xx,yy){
			draw_sprite_ext(spr_buff_crystalis,0,xx,yy,1,1,0,-1,1);
			draw_sprite_ext(spr_buff_crystalis,1,xx,yy,1,1,0,-1,icon_alpha);
			draw_sprite_ext(spr_buff_crystalis,2,xx,yy,1,1,0,-1,1);
			draw_buff_bar(surf,xx,yy,spr_buff_crystalis_bar,0,atkpower,1,atkpower_level,0);
			draw_buff_bar(surf,xx,yy,spr_buff_crystalis_bar,1,100-atkbonus_fadetime*(1/3),icon_alpha,atkbonus.value/0.15,0);
		}
	}

	ds_list_add(battle_ui.buff_list,buff_crystalis);
}