live;
event_inherited();

if(rampage = true){
	time = 0;
}

if(enabled = true){
	if(time > 0){
		time -= 1;
		if((time-1) mod 5 = 0){
			damage = 2.4375;
			switch(weapon_level){
				case 0:damage = 2.4375/2*global.atk_subweapon;break;
				case 1:damage = 2.535/2*global.atk_subweapon;break;
				case 2:damage = 2.7625/2*global.atk_subweapon;break;
				case 3:damage = 2.7857/2*global.atk_subweapon;break;
			}
			
			tt = 3 - ((time-1) div 5);
			
			target = instance_nearest(player.x,player.y,enemy_agent);
			if(instance_exists(target)){
			    target_x = target.x;
			    target_y = target.y;
			} else {
			    target = noone;
			    target_x = player.x;
			    target_y = player.y-800;
			}
			if(number[tt] = 1){
				ang = (dir=0 ? 0 : 180)+(dir=0 ? -1 : 1)*(tt*7);
				blt = MakePlayerBullet(x,y-17,bullet_player_annihilator);
				blt.direction = ang;
				blt.image_angle = ang - 90;
				blt.speed = 10;
				blt.track_inst = target;
				blt.target_x = target_x;
				blt.target_y = target_y;
				blt.damage = damage;
				blt.tail_image = 2;
			}
			else{
				for(i=0;i<2;i+=1){
					ang = (dir=0 ? 0 : 180)+(dir=0 ? -1 : 1)*(tt*7+i*30);
					blt = MakePlayerBullet(x,y-17,bullet_player_annihilator);
					blt.direction = ang;
					blt.image_angle = ang - 90;
					blt.speed = 10;
					blt.track_inst = target;
					blt.target_x = target_x;
					blt.target_y = target_y;
					blt.damage = damage;
					blt.tail_image = 2;
				}
			}
		}
	}
}
else{
	time = 0;
}