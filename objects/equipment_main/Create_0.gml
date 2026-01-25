event_inherited();

enabled = false

xscale = 1
yscale = 1
plane = plane_apex_zero
wingman_left = []
wingman_right = []
wingman_x_offset = [60,180]
wingman_y_offset = [0,0]
//subweapon = subweapon_cruise_missile
armor = armor_agent

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}
*/

//tb = MakeEnemyBullet(200,900+random(10),bullet_enemy_red,spr_bullet_enemy_red_0);