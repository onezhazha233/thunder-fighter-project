//live;
event_inherited();

//enabled = true

attack_0 = function(){//蓝散弹
	live_name = "emitter_boss_sirius_twins_1:attack_0";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_mini_og1_1_attack);
	}
	if((attack_time div 1) mod 8 < 6){
		for(i=0;i<5;i+=1){
			blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.image_index = 1;
			with(blt){
				custom_function = function(){
					image_xscale = 1 + sin(duration/3)*0.1;
					image_yscale = 1 - sin(duration/3)*0.1;
				}
			}
			blt.direction = 360/5*i + attack_time*3.5;
			blt.speed = 8 - (attack_time/15);
		}
	}
	if(attack_time = 80){
		mark.SetIdle();
	}
	if(attack_time = 95){
		end_attack();
	}
}

attack_1 = function(){//紫红交替弧
	live_name = "emitter_boss_sirius_twins_1:attack_1";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og1_1_attack);
	}
	if(attack_time <= 20){
		if(attack_time mod 2 = 0){
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 2;
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = i*120 + (attack_time-2)*4.5;
				Anim_Create(blt,"speed",0,0,10,-10,60);
				Anim_Create(blt,"speed",0,0,0,-12,30,120-attack_time);
			}
		}
	}
	if(attack_time > 20&&attack_time <= 40){
		if((attack_time-20) mod 2 = 0){
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 0;
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = i*120 - (attack_time-22)*4.5;
				Anim_Create(blt,"speed",0,0,10,-10,60);
				Anim_Create(blt,"speed",0,0,0,-12,30,120-(attack_time-22));
			}
		}
	}
	if(attack_time > 40&&attack_time <= 60){
		if((attack_time-40) mod 2 = 0){
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 2;
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = i*120 + (attack_time-42)*4.5+60;
				Anim_Create(blt,"speed",0,0,10,-10,60);
				Anim_Create(blt,"speed",0,0,0,-12,30,120-(attack_time-42));
			}
		}
	}
	if(attack_time > 60&&attack_time <= 80){
		if((attack_time-60) mod 2 = 0){
			for(i=0;i<3;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 0;
				blt.image_xscale = 2;
				blt.image_yscale = 2;
				blt.direction = i*120 - (attack_time-62)*4.5+60;
				Anim_Create(blt,"speed",0,0,10,-10,60);
				Anim_Create(blt,"speed",0,0,0,-12,30,120-(attack_time-62));
			}
		}
	}
	if(attack_time = 80){
		mark.SetIdle();
	}
	if(attack_time = 150){
		mark.SetMoveEnabled(true);
	}
	if(attack_time = 180){
		end_attack();
	}
}
	
attack_2 = function(){//双色散弹
	live_name = "emitter_boss_sirius_twins_1:attack_2";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og1_1_attack);
	}
	if(attack_time < 120&&attack_time mod 3 = 0){
		for(i=0;i<3;i+=1){
			blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			blt.image_index = 1;
			blt.direction = i*120 + attack_time*7;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,12,-10,20);
			Anim_Create(blt,"speed",0,0,2,10,5,50);
			blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			blt.image_index = 2;
			blt.direction = i*120 - attack_time*3;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,12,-10,20);
			Anim_Create(blt,"speed",0,0,2,10,10,30);
			Anim_Create(blt,"direction",0,0,blt.direction,60,120,30);
			Anim_Create(blt,"image_angle",0,0,blt.image_angle,60,120,30);
			
		}
	}
	if(attack_time = 200){
		mark.SetIdle();
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

attack_3 = function(){//四次旋转散弹
	live_name = "emitter_boss_sirius_twins_1:attack_3";
	live;
	if(attack_time = 1){
		for(i=0;i<20;i+=1){
			blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			blt.direction = i*(360/20);
			Anim_Create(blt,"speed",0,0,10,-10,20);
			Anim_Create(blt,"speed",0,0,0,10,60,30);
			Anim_Create(blt,"direction",0,0,blt.direction,120,60,30);
		}
	}
	if(attack_time = 20){
		for(j=0;j<2;j+=1){
			for(i=0;i<15;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = i*(360/15)+attack_time;
				blt.image_index = 1;
				Anim_Create(blt,"speed",0,0,10+j*2,-10-j*2,20);
				Anim_Create(blt,"speed",0,0,0,10+j,60,30);
				Anim_Create(blt,"direction",0,0,blt.direction,100*(j mod 2 = 0 ? 1 : -1),60,30);
			}
		}
	}
	if(attack_time = 40){
		for(j=0;j<3;j+=1){
			for(i=0;i<10;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = i*(360/10)+attack_time;
				blt.image_index = 2;
				Anim_Create(blt,"speed",0,0,10+j*2,-10-j*2,20);
				Anim_Create(blt,"speed",0,0,0,10+j,60,30);
				Anim_Create(blt,"direction",0,0,blt.direction,80*(j mod 2 = 0 ? 1 : -1),60,30);
			}
		}
	}
	if(attack_time = 60){
		for(j=0;j<4;j+=1){
			for(i=0;i<8;i+=1){
				blt = MakeEnemyBullet(x,y-87,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.direction = i*(360/8)+attack_time;
				blt.image_index = 3;
				Anim_Create(blt,"speed",0,0,10+j*2,-10-j*2,20);
				Anim_Create(blt,"speed",0,0,0,10+j,60,30);
				Anim_Create(blt,"direction",0,0,blt.direction,60*(j mod 2 = 0 ? 1 : -1),60,30);
			}
		}
	}
	if(attack_time = 150){
		end_attack();
	}
}

attack_4 = function(){//延迟分裂狙
	live_name = "emitter_boss_sirius_twins_1:attack_4";
	live;
	if(attack_time = 1||attack_time = 40){
		var _tx = instance_exists(player) ? player.x : mouse_x;
		var _ty = instance_exists(player) ? player.y : mouse_y;
		dd = point_direction(x, y-87, _tx, _ty);
		xx = x;
		yy = y - 87;
	}
	if(attack_time < 30){
		if(attack_time mod 4 = 0){
			for(i=0;i<5;i+=1){
				blt = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.direction = i*72+dd+180;
				blt.image_angle = blt.direction;
				blt.duration = 60;
				blt.dd = dd;
				Anim_Create(blt,"speed",0,0,9,-8,30);
				with(blt){
					custom_function = function(){
						if(duration = 1){
							for(i=0;i<6;i+=1){
								blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
								blt.direction = i*60+dd;
								blt.image_angle = blt.direction;
								blt.speed = 12;
							}
						}
					}
				}
			}
		}
	}
	if(attack_time > 40&&attack_time < 70){
		if(attack_time mod 4 = 0){
			for(i=0;i<6;i+=1){
				blt = MakeEnemyBullet(xx,yy,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				blt.direction = i*60+dd+30;
				blt.image_angle = blt.direction;
				blt.duration = 60;
				blt.dd = dd;
				Anim_Create(blt,"speed",0,0,9,-8,30);
				with(blt){
					custom_function = function(){
						if(duration = 1){
							for(i=0;i<5;i+=1){
								blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
								blt.direction = i*72+dd;
								blt.image_angle = blt.direction;
								blt.speed = 12;
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 180){
		end_attack();
	}
}

a0 = create_attack(0,attack_0,50)
a1 = create_attack(1,attack_1,50)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,50)
a4 = create_attack(4,attack_4,20)

fixed_sequence = [a1,a0,a2,a4,a3]
random_pool = [a0,a1,a2,a3,a4]