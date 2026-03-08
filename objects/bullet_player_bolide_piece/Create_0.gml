live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

damage = 1
damage_type = 1
damage_interval = 5
collision_destroy = false

collision_effect = seq_bullet_effect_armor_piercer_a

tail_sprite = spr_bolide_a_piece_1
tail_distance = 0
tail_distance_target = 70

function CollideSingleEnemy(enemy){
	if(damage_type = 1){
		if!(ds_map_exists(collision_enemy,enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			enemy.last_bullet = id;
			event_user(0);
			enemy.Hurt();
			if!(collision_effect = noone){
				var eff = MakeEffect(x,y,collision_effect,scale_x*collision_effect_scale_x,scale_y*collision_effect_scale_y,collision_effect_add);
				layer_sequence_angle(eff,image_angle-90);
			}
		}
	}
}