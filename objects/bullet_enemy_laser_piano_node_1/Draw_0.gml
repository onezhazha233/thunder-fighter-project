live;
event_inherited()

if(state < 2){
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_warning,0,x,y,ring_scale,ring_scale,ring_angle,-1,ring_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_warning,1,x,y,ring_logo_scale,ring_logo_scale,0,-1,ring_logo_alpha);
}
else{
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_trangle,1,x,y,node_trangle_1_scale,node_trangle_1_scale,0,-1,node_trangle_1_alpha*node_0_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_1_bg,0,x,y,node_0_scale,node_0_scale,0,-1,node_0_alpha);
	if(node_part = 1){
		for(i=0;i<3;i+=1){
			draw_sprite_ext(spr_bullet_enemy_laser_piano_node_bottom,0,x+lengthdir_x(node_bottom_dist,i*120-90),y+lengthdir_y(node_bottom_dist,i*120-90),node_0_scale,node_1_scale,i*120,-1,node_0_alpha);
			draw_sprite_ext(spr_bullet_enemy_laser_piano_node_redpoint,0,x+lengthdir_x(node_bottom_dist,i*120-90)*1.4,y+lengthdir_y(node_bottom_dist,i*120-90)*1.4,node_0_scale,node_1_scale,0,-1,redlight_alpha);
		}
	}
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_1,1,x,y,node_1_scale,node_1_scale,0,-1,node_1_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_1,0,x,y,node_0_scale,node_0_scale,0,-1,node_0_alpha);
	draw_sprite_ext(spr_bullet_enemy_laser_piano_node_trangle,0,x,y,node_0_scale,node_0_scale,0,-1,node_trangle_0_alpha*node_0_alpha);
}