live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;
if(laser_offset <= -sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;

find = laser_find_width(x+x_offset,y+y_offset,image_angle,range,1,enemy_agent,true,false)
len = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		len = _dist;
		find_enemy = _inst;
		break;
	}
}

gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x+x_offset,y+y_offset,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x+x_offset,y+y_offset,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
draw_laser(spr_bullet_player_blade_abcd_line_point,0,x+x_offset,y+y_offset,laser_offset,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
gpu_set_blendmode(bm_normal)

if(instance_exists(find_enemy)){
	ex = x + x_offset + lengthdir_x(len,image_angle);
	ey = y + y_offset + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_player_blade_abcd_point,0,ex,ey,0.5*scale_x,scale_y,0,-1,1);
	if(edge_state = 2){
		instance_destroy(edge_sequence);
		slash_x = ex + lengthdir_x(20,image_angle)*scale_x;
		slash_y = ey + lengthdir_y(20,image_angle)*scale_y;
		if(edge_attack_sequence_enabled = true){
			if(rampage = true){
				edge_attack_sequence = layer_sequence_create(layer_edge,edge_x,edge_y,seq_bullet_player_blade_b_edge_attack_rampage);
				audio_play_sound(snd_blade_shoot_rampage,0,0);
			}
			else{
				edge_attack_sequence = layer_sequence_create(layer_edge,edge_x,edge_y,seq_bullet_player_blade_b_edge_attack);
				audio_play_sound(snd_blade_shoot_idle,0,0);
			}
		}
		
		Sequence_PlayByFrame(layer_edge);
		
		instance_create_depth(slash_x,slash_y,0,bullet_effect_blade_slash_ring);
		dir = -65/2+random_range(-30,30);
		a = instance_create_depth(slash_x,slash_y,0,bullet_player_plane_blade_slash);
		a.slash_sequence = seq_bullet_player_blade_b_slash;
		a.slash_rampage_sequence = seq_bullet_player_blade_b_slash_rampage;
		a.point_sprite = spr_bullet_player_blade_b_slash_point;
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		a.image_angle = dir;
		a.rampage = rampage;
		a.damage = slash_damage;
		alarm[1] = 4;
		edge_state = 0;
		edge_cd = edge_cdd;
	}
}
if(edge_attack_sequence_enabled = true){
	if(layer_sequence_exists(layer_edge,edge_attack_sequence)){
		layer_sequence_x(edge_attack_sequence,edge_x);
		layer_sequence_y(edge_attack_sequence,edge_y);
		layer_sequence_xscale(edge_attack_sequence,image_xscale*scale_x);
		layer_sequence_yscale(edge_attack_sequence,image_yscale*scale_y);
		layer_sequence_angle(edge_attack_sequence,image_angle-90);
	}
}