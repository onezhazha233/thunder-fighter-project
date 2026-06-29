live;
event_inherited();

attack_0 = function(){
	if(attack_time = 1){
		aa = 0;
		ea = 0;
		rot = 1.5;
		a0d = 630;
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				ix = -1100+i*150;
				iy = -1000+j*150;
				if!(point_in_rectangle(mouse_x,mouse_y,ix-75,iy-75,ix+75,iy+75)){
					bb[i][j] = MakeEnemyBullet(ix,iy,bullet_enemy_normal);
					bb[i][j].sprite_index = spr_pixel2x;
					bb[i][j].image_xscale = 70;
					bb[i][j].image_yscale = 10;
					bb[i][j].image_alpha = 0;
					bb[i][j].direction = -90;
					bb[i][j].speed = 3;
					bb[i][j].mask_index = -1;
					bb[i][j].auto_destroy = false;
				}
				else{
					ei = i;
					ej = j;
				}
				Anim_Create(id,"aa",0,0,0,1,40);
			}
		}
		
	}
	if(attack_time > 1){
		if(bb[0][0].x > -1100+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x -= 600;
				}
			}
		}
		if(bb[0][0].y > -1000+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y -= 600;
				}
			}
		}
		if(bb[0][0].x < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x += 600;
				}
			}
		}
		if(bb[0][0].y < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y += 600;
				}
			}
		}
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))bb[i][j].image_angle += rot;
				if(instance_exists(bb[i][j]))dist = point_distance(bb[i][j].x,bb[i][j].y,mouse_x,mouse_y);
				ba = 1;
				if(dist < 200)ba = 1;
				if(dist >= 200&&dist < 300)ba = 1-(dist-200)/100;
				if(dist >= 300)ba = 0;
				if(instance_exists(bb[i][j])){
					bb[i][j].image_alpha = ba*aa;
					if(i = ei&&j = ej){
						bb[i][j].image_alpha =ba*aa*ea;
					}
				}
			}
		}
	}
	if(attack_time = 40){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				with(bb[i][j])mask_index = sprite_index;
			}
		}
	}
	if(attack_time mod 120 = 0&&attack_time<a0d-90){
		if(!instance_exists(bb[ei][ej])){
			bb[ei][ej] = MakeEnemyBullet(bb[ei-1][ej].x+150,bb[ei-1][ej].y,bullet_enemy_normal);
			bb[ei][ej].sprite_index = spr_pixel2x;
			bb[ei][ej].image_xscale = 70;
			bb[ei][ej].image_yscale = 10;
			bb[ei][ej].image_alpha = 0;
			bb[ei][ej].speed = 3;
			bb[ei][ej].direction = bb[0][0].direction;
			bb[ei][ej].auto_destroy = false;
			Anim_Create(id,"ea",0,0,0,1,40);
		}
		rdm = 45*(sign(sin(attack_time*159)*753));
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))Anim_Create(bb[i][j],"direction",0,0,bb[i][j].direction,rdm,80);
			}
		}
	}
	if(attack_time = a0d-90){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				bb[i][j].mask_index = -1;
				Anim_Create(bb[i][j],"speed",0,0,bb[i][j].speed,-bb[i][j].speed,60);
				Anim_Create(id,"rot",0,0,rot,-rot,60);
				Anim_Create(id,"aa",0,0,1,-1,60,30);
			}
		}
	}
	if(attack_time = a0d){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j])){
					bb[i][j].destroy_type = 3;
					instance_destroy(bb[i][j]);
				}
			}
		}
		end_attack();
	}
}

var a0 = create_attack(0, attack_0,30);

fixed_sequence = [a0];
random_pool = [a0]