live;
laser_offset += offset_speed
if(laser_offset >= sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;
if(laser_offset <= -sprite_get_height(spr_bullet_player_blade_abcd_line_point))laser_offset = 0;

find = laser_find(x,y,image_angle,range,enemy_agent,true,true)
len = find[0]
if(len = -1)len = range;

gpu_set_blendmode(bm_add)
draw_laser(laser_sprite,0,x,y,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha)
draw_laser(laser_sprite,0,x,y,0,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
draw_laser(spr_bullet_player_blade_abcd_line_point,0,x,y,laser_offset,image_angle,len,false,image_xscale*scale_x,image_yscale*scale_y,image_alpha/2)
gpu_set_blendmode(bm_normal)

rampage = (laser_sprite == spr_bullet_player_phantom_a_rampage);

if(instance_exists(find[1])){
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	draw_sprite_ext(spr_bullet_player_blade_abcd_point,0,ex,ey,0.5*scale_x,scale_y,0,-1,1);
}