live;
find = laser_find_width(x,y,image_angle,range,width*scale_x,enemy_agent,true,true)
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

sh = sprite_get_height(start_sprite)-5-1
draw_laser(start_sprite,image_index,x,y,0,image_angle,length,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha,true);
if(length > sh*scale_y)draw_laser(laser_sprite,image_index,x+lengthdir_x(sh*scale_x,image_angle),y+lengthdir_y(sh*scale_y,image_angle),0,image_angle,length-sh*scale_y,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha);

if(instance_exists(find_enemy)){
	enemy = find_enemy;
	enemy.last_bullet = id;
	CollideSingleEnemy(enemy);
	ex = x + lengthdir_x(length,image_angle);
	ey = y + lengthdir_y(length,image_angle);
	draw_sprite_ext(spr_bullet_effect_mega,0,ex,ey,image_xscale*scale_x*choose(1,-1)/0.8,image_yscale*scale_y*image_xscale/0.8,choose(0,180),-1,image_alpha);
}