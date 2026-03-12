live;
duration -= 1
if(duration = 0)instance_destroy();

image_blend = make_color_rgb(color_r,color_g,color_b)

find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*(20/34),enemy_agent,true,true)
len = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		len = _dist;
		find_enemy = _inst;
		break;
	}
}

gpu_set_blendmode(bm_add);
draw_laser(start_sprite[0],0,x,y,0,image_angle,len,0,image_xscale*scale_x,image_yscale*scale_y,image_alpha,true,false,image_blend)
draw_laser(laser_sprite,0,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha,false,false,image_blend);
//draw_sprite_ext(laser_sprite,0,x+60+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),image_xscale*scale_x,image_yscale*scale_y*1000,image_angle-90,image_blend,image_alpha);
draw_sprite_ext(start_sprite[1],0,x+lengthdir_x(25*scale_x,image_angle),y+lengthdir_y(25*scale_y,image_angle),start1_xscale*scale_x,start1_yscale*scale_y,image_angle-90,image_blend,image_alpha)
gpu_set_blendmode(bm_normal)
if(instance_exists(find_enemy)){
	enemy = find_enemy;
	CollideSingleEnemy(enemy);
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_effect_mega,0,ex,ey,image_xscale*scale_x*choose(1,-1)*0.7,image_yscale*scale_y*image_xscale*0.5,choose(0,180),-1,image_alpha);
}
