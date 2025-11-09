live;
duration -= 1
if(duration = 0)instance_destroy();

find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*(9/25),enemy_agent,true,true)
len = find[0]
if(instance_exists(find[1])&&find[1].inv_collision = true){
	len = range;
}
if(len = -1)len = range;

//
//draw_laser(laser_sprite,0,x,y,0,image_angle,len,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,true,image_xscale*scale_x,image_yscale*scale_y,light)
gpu_set_blendmode(bm_normal)
draw_sprite_ext(spr_bullet_player_glacier_a_start_big,0,x,y,image_xscale*scale_x,image_yscale*scale_y,image_angle-90,image_blend,image_alpha)

if(instance_exists(find[1])&&find[1].inv_collision = false){
	enemy = find[1];
	CollideSingleEnemy(enemy);
	enemy.frozen_amount += 2;
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_effect_phantom_a,0,ex,ey,image_xscale*scale_x,image_xscale*scale_y,0,-1,1);
}