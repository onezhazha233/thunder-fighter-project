live;
event_inherited();

enabled = false

xscale = 1
yscale = 1

//plane = plane_phantom_c
plane = global.current_equipment.plane
wingman_left = global.current_equipment.wingman_left
wingman_right = global.current_equipment.wingman_right
wingman_x_offset = global.current_equipment.wingman_x_offset
wingman_y_offset = global.current_equipment.wingman_y_offset
subweapon = global.current_equipment.subweapon
armor = global.current_equipment.armor

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}
*/

/*(for(i=0;i<40;i+=1){
	for(j=0;j<5;j+=1){
		tb = MakeEnemyBullet(0+i*20,500+j*40,bullet_enemy_normal,spr_bullet_enemy_normal_0);
	}
}