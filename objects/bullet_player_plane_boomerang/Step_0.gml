live;
event_inherited();

image_angle += rot

speed -= acceleration

if(fade = 1){
	image_xscale -= 0.2;
	image_yscale -= 0.2;
	image_alpha -= 0.3;
	if(image_alpha <= 0)instance_destroy();
}

switch(state){
	case 0:
		if(speed < 0){
			state = 1;
		}
		break;
		
	case 1:
		if(y >= min(ystart+250,1100)){
			fade = 1;
		}
		else{
			x += sign(emitter_plane_boomerang.x-x)*(-speed)/2;
			with(emitter_plane_boomerang){
				if(point_in_circle(x,y,other.x,other.y,50)){
					with(other){
						if(fade = 0){
							state = 2;
							speed = spd_start/1.5;
							ds_map_clear(collision_enemy);
						}
					}
				}
			}
		}
		break;
		
	case 2:
		if(speed < 0){
			state = 3;
			ds_map_clear(collision_enemy);
		}
		break;
		
	case 3:
		if(y >= min(ystart+250,1100)){
			fade = 1;
		}
		else{
			with(emitter_plane_boomerang){
				if(point_in_circle(x,y,other.x,other.y,50)){
					with(other){
						instance_destroy();
					}
				}
			}
		}
		break;
}