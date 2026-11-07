//live;
event_inherited();

attack_0 = function(){//收缩瞄准散射
	live_name = "emitter_boss_xenomorph:attack_0";
	live;
	if(attack_time = 1){
		rr = 240;
		Anim_Create(id,"rr",0,0,rr,10-rr,90);
		var _tx = instance_exists(player) ? player.x : mouse_x;
		var _ty = instance_exists(player) ? player.y : mouse_y;
		dd = point_direction(x,y+80,_tx,_ty);
		mark.SetMoveEnabled(false);
	}
	if(attack_time > 1&&attack_time < 100){
		if(attack_time mod 10 = 0){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			for(i=0;i<9;i+=1){
				bb = MakeEnemyBullet(x,y+80,bullet_enemy_normal);
				bb.direction = dd-4*(rr/9)+i*(rr/9);
				bb.speed = 3;
				bb.image_xscale = 2;
				bb.image_yscale = 2;
				Anim_Create(bb,"speed",0,0,3,10,20,40);
			}
		}
	}
	if(attack_time = 160){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}

a0 = create_attack(0,attack_0,40)
/*a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,40)
a3 = create_attack(2,attack_3,40)
a4 = create_attack(3,attack_4,40)
a5 = create_attack(4,attack_5,40)
a6 = create_attack(5,attack_6,40)*/

fixed_sequence = [a0/*,a1,a2,a3,a4,a5,a6*/]
//random_pool = [a0,a1,a2,a3,a4,a5,a6]