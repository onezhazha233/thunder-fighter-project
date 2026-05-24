live;
if(instance_exists(bullet_enemy_laser_piano_node_0)){
	with(bullet_enemy_laser_piano_node_0){
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_redlight,0,x,y,redlight_scale,redlight_scale,0,-1,redlight_alpha);
	}
}
else if(instance_exists(bullet_enemy_laser_piano_node_1)){
	with(bullet_enemy_laser_piano_node_1){
		draw_sprite_ext(spr_bullet_enemy_laser_piano_node_redlight,0,x,y,redlight_scale,redlight_scale,0,-1,redlight_alpha);
	}
}
else{
	instance_destroy();
}