function Player_SetShield(shield_duration){
	if(Player_IsEnabled()){
		if(shield_duration > 0){
			layer_sequence_create(global.layer_item_effects,player.x,player.y,seq_battle_item_effect_quantum_shield);
			if(instance_exists(battle_quantum_shield)){
				with(battle_quantum_shield){
					duration = shield_duration;
					destroy_time = 0;
					fade = 0;
					fade_time = 0;
					global.inv_shield = 1;
					if(shield_duration > 0){
						if!(layer_sequence_exists(sl,shield_sequence)){
							image_xscale = 0.7;
							image_yscale = 0.7;

							Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,1-image_xscale,10);
							Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,1-image_yscale,10);
							
							shield_sequence = layer_sequence_create(sl,x,y,seq_battle_quantum_shield);
							layer_sequence_xscale(shield_sequence,image_xscale);
							layer_sequence_yscale(shield_sequence,image_yscale);
						}
					}
				}
			}
			else{
				shield = instance_create_depth(player.x,player.y,0,battle_quantum_shield);
				shield.duration = shield_duration;
			}
		}
		else{
			with(battle_quantum_shield){
				duration = -1;
			}
		}
		return true;
	}
	else{
		return false;
	}
}
