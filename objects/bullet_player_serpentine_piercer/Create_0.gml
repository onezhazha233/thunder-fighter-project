live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_destroy = false

collision_effect = seq_bullet_effect_armor_piercer_a

damage_type = 0

body_sprite = spr_serpentine_piercer_a_body
flame_sprite = spr_serpentine_piercer_ab_flame
l0_sprite = spr_serpentine_piercer_a_light_0
l2_sprite = spr_serpentine_piercer_a_light_2

time = 0
time_spd = 1
efftime = 0
dir = 1

animtime = 0

history_x = array_create(12,x);
history_y = array_create(12,y);
history_sprite_index = array_create(12,spr_serpentine_piercer_cd_light_0);
current_frame = 0;

history_image_xscale = array_create(12,scale_x);
history_image_yscale = array_create(12,scale_y);
history_image_angle = array_create(12,0);

rampage = false

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	layer_sequence_angle(MakeEffect(x,y+(-30+(time mod 4)*12)*scale_y,collision_effect,scale_x,scale_y),image_angle);
	efftime += 1;
}