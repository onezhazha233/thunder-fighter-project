event_inherited();

xscale = 1
yscale = 1
plane = plane_x_wing_glacier
wingman_left = [wingman_final_annihilator]
wingman_right = [wingman_final_annihilator]
wingman_x_offset = [130,250]
wingman_y_offset = [0,0]
subweapon = subweapon_condensed_warper
armor = armor_frost_d

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}
*/

//tb = MakeEnemyBullet(200,900+random(10),bullet_enemy_red,spr_bullet_enemy_red_0);