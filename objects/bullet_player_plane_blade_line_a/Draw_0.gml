live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;
if(laser_offset <= -sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;

find = laser_find(x,y,image_angle,range,enemy_agent,true,true)
len = find[0]
if(len = -1)len = range;

gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x,y,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x,y,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
draw_laser(spr_bullet_player_blade_abcd_line_point,0,x,y,laser_offset,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
gpu_set_blendmode(bm_normal)

rampage = (laser_sprite == spr_bullet_player_phantom_a_rampage);

if(instance_exists(find[1])){
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_player_blade_abcd_point,0,ex,ey,0.5*scale_x,scale_y,0,-1,1);
	if(edge_state = 2){
		layer_sequence_destroy(edge_sequence);
		slash_x = find[1].x;
		slash_y = find[1].y;
		if(edge_sequence_enabled = true){
			edge_attack_sequence = layer_sequence_create("planes_upper",x,y,seq_bullet_player_blade_a_edge_attack);
			instance_create_depth(slash_x,slash_y,0,bullet_effect_blade_slash_ring);
		}
		dir = -65/2;
		a = instance_create_depth(slash_x,slash_y,0,bullet_player_plane_blade_a_slash);
		a.image_angle = dir;
		alarm[1] = 4;
		edge_state = 0;
		edge_cd = 45;
	}
}

if(layer_sequence_exists("planes_upper",edge_sequence)){
	layer_sequence_x(edge_sequence,x);
	layer_sequence_y(edge_sequence,y);
	layer_sequence_xscale(edge_sequence,image_xscale);
	layer_sequence_yscale(edge_sequence,image_yscale);
	layer_sequence_angle(edge_sequence,image_angle-90);
}
if(layer_sequence_exists("planes_upper",edge_attack_sequence)){
	layer_sequence_x(edge_attack_sequence,x);
	layer_sequence_y(edge_attack_sequence,y);
	layer_sequence_xscale(edge_attack_sequence,image_xscale);
	layer_sequence_yscale(edge_attack_sequence,image_yscale);
	layer_sequence_angle(edge_attack_sequence,image_angle-90);
}