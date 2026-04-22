//live;
event_inherited();

mode = EMITTER_MODE.FIXED;

ls = noone

attack_0 = function(){
	live_name = "emitter_enemy_og0c1:attack_0";
	live;
	if(attack_time = 1||attack_time = 60){
		for(var i=0; i<4; i++){
			for(k=0;k<2;k+=1){
				dd = -90;
				a = MakeEnemyBullet(x-78,y+33,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				a.image_angle = dd-30+60*k;
				a.direction = a.image_angle;
				a.speed = 8+i;
				with(a){
					custom_function = function(){
						if(x <= 0){
							bounced = true;
							x = 0;
							hspeed *= -0.6;
							image_angle = direction;
						}
						if(x >= room_width){
							bounced = true;
							x = room_width;
							hspeed *= -0.6;
							image_angle = direction;
						}
					}
				}
			}
		}
	}
	if(attack_time = 30||attack_time = 90){
		for(var i=0; i<4; i++){
			for(k=0;k<2;k+=1){
				dd = -90;
				a = MakeEnemyBullet(x+78,y+33,bullet_enemy_normal,spr_bullet_enemy_normal_2);
				a.image_angle = dd-30+60*k;
				a.direction = a.image_angle;
				a.speed = 8+i;
				with(a){
					custom_function = function(){
						if(x <= 0){
							bounced = true;
							x = 0;
							hspeed *= -0.6;
							image_angle = direction;
						}
						if(x >= room_width){
							bounced = true;
							x = room_width;
							hspeed *= -0.6;
							image_angle = direction;
						}
					}
				}
			}
		}
	}
	if(attack_time = 100){
		end_attack();
	}
}

attack_1 = function(){
	live_name = "emitter_enemy_og0c1:attack_1";
	live;
	if(attack_time < 60&&attack_time mod 5 = 0){
		for(k=0;k<2;k+=1){
			for(i=0;i<4;i+=1){
				blt = MakeEnemyBullet(x-60+k*120,y-55,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.image_angle = -36-36*i;
				blt.direction = blt.image_angle-360;
				blt.speed = -6;
				Anim_Create(blt,"speed",0,0,-6,15,40);
				Anim_Create(blt,"direction",0,0,blt.direction,-144+36*i-blt.direction+360,40,40);
				Anim_Create(blt,"image_angle",0,0,blt.image_angle,-144+36*i-blt.image_angle,40,40);
			}
		}
	}
	if(attack_time = 60){
		end_attack();
	}
}

attack_2 = function(){
	live_name = "emitter_enemy_og0c1:attack_2";
	live;
	if(attack_time = 1||attack_time = 60){
		for(k=0;k<2;k+=1){
			for(j=0;j<4;j+=1){
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x-78+156*k,y+33,bullet_enemy_normal,spr_bullet_enemy_normal_0);
					a.direction = -36*i;
					a.speed = 2-j*0.3;
					a.time = 0;
					a.dd = j;
					with(a){
						custom_function = function(){
							time += 1;
							if(time = 60+dd*3){
								pd = -90;
								if(instance_exists(player)){
									pd = point_direction(x,y,player.x,player.y);
								}
								direction = pd;
								Anim_Create(id,"speed",0,0,0,15,20,dd*5);
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 90){
		end_attack();
	}
}

var a0 = create_attack(1,attack_0,60);
var a1 = create_attack(2,attack_1,60);
var a2 = create_attack(3,attack_2,90);

fixed_sequence = [a0,a1,a2]