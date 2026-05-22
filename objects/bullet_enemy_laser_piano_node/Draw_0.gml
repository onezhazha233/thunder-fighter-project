live;
event_inherited()

if(state < 2){
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_warning,0,x,y,ring_scale,ring_scale,ring_angle,-1,ring_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_warning,1,x,y,ring_logo_scale,ring_logo_scale,0,-1,ring_logo_alpha);
}
else{
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_bg,0,x,y,node_0_scale,node_0_scale,0,-1,node_0_alpha);
	if(node_part = 1){
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_bottom,0,x,y+node_bottom_y*node_0_scale,node_0_scale,node_1_scale,0,-1,node_0_alpha);
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_redcircle,0,x,y+node_redcircle_y*node_0_scale,node_0_scale,node_1_scale,0,-1,node_0_alpha);
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_side,0,x+node_side_x*node_0_scale,y+node_side_y*node_0_scale,node_0_scale,node_1_scale,0,-1,node_0_alpha);
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_side,0,x-node_side_x*node_0_scale,y+node_side_y*node_0_scale,-node_0_scale,node_1_scale,0,-1,node_0_alpha);
	}
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node,1,x,y,node_1_scale,node_1_scale,0,-1,node_1_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node,0,x,y,node_0_scale,node_0_scale,0,-1,node_0_alpha);
}