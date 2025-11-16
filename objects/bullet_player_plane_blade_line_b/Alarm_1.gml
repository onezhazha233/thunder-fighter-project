live;
a = instance_create_depth(slash_x,slash_y,0,bullet_player_plane_blade_slash);
a.slash_sequence = seq_bullet_player_blade_b_slash;
a.slash_rampage_sequence = seq_bullet_player_blade_b_slash_rampage;
a.point_sprite = spr_bullet_player_blade_b_slash_point;
a.scale_x = scale_x;
a.scale_y = scale_y;
a.image_angle = dir+65;
a.rampage = rampage;
a.damage = slash_damage

if(edge_attack_sequence_enabled = true){
	if(rampage = false){
		a = instance_create_depth(edge_x+lengthdir_x(100,image_angle),edge_y+lengthdir_y(100,image_angle),0,bullet_player);
		a.image_xscale = 100;
		a.image_yscale = 80;
	}
	else{
		a = instance_create_depth(edge_x+lengthdir_x(120,image_angle),edge_y+lengthdir_y(120,image_angle),0,bullet_player);
		a.image_xscale = 120;
		a.image_yscale = 150;
	}
	a.sprite_index = spr_pixel2x;
	a.duration = 1;
	a.image_angle = image_angle;
	a.collision_type = COLLISION_TYPE.SPRITE;
	a.collision_single = false;
	a.collision_destroy = false;
	a.damage_type = 1;
	a.damage_interval = 999;
	a.damage = slash_damage;
}