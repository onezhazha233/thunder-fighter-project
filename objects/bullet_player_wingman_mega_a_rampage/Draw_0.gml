live;
surface_set_target(surf)
draw_sprite_ext(start_sprite,image_index,sprite_get_width(start_sprite)/2,5,image_xscale,-image_yscale,0,-1,1);
draw_sprite_ext(laser_sprite,image_index,sprite_get_width(start_sprite)/2,sprite_get_height(start_sprite),image_xscale,-1500,0,-1,1);
surface_reset_target()

find = laser_find_width(x,y,image_angle+90,range,width*scale_x,enemy_agent,true,true)
length = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		length = _dist;
		find_enemy = _inst;
		break;
	}
}

xx = x+lengthdir_x(-sprite_get_width(start_sprite)/2,image_angle)+lengthdir_x(-0,image_angle+90)
yy = y+lengthdir_y(-sprite_get_width(start_sprite)/2,image_angle)+lengthdir_y(-0,image_angle+90)
draw_surface_general(surf,0,0,sprite_get_width(start_sprite),length,xx,yy,scale_x,-scale_y,image_angle,-1,-1,-1,-1,image_alpha)

if(instance_exists(find_enemy)){
	enemy = find_enemy;
	enemy.last_bullet = id;
	CollideSingleEnemy(enemy);
	ex = x + lengthdir_x(length,image_angle+90);
	ey = y + lengthdir_y(length,image_angle+90);
	draw_sprite_ext(spr_bullet_effect_mega,0,ex,ey,image_xscale*scale_x*choose(1,-1),image_yscale*scale_y*image_xscale,choose(0,180),-1,image_alpha);
}