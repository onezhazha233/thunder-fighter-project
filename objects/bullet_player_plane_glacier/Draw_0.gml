live;
duration -= 1
if(duration = 0)instance_destroy();
time += 1

find = laser_find_width(x,y,image_angle,range,sprite_get_width(laser_sprite)*image_xscale*scale_x*(9/25),enemy_agent,true,true)
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

if(size = 0){
	gpu_set_blendmode(bm_add);
}
draw_laser(laser_sprite,0,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,true,image_xscale*scale_x,image_yscale*scale_y,image_alpha);
if(size = 1){
	gpu_set_blendmode(bm_add);
	draw_laser(laser_sprite,light_image,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,true,image_xscale*scale_x,image_yscale*scale_y,light_alpha);
}
if(glow_offset > -1){
	glow_offset += 36;
	if(glow_offset > 1500)glow_offset = 0;
	draw_laser(spr_bullet_player_glacier_d_glow,0,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),glow_offset,image_angle,len-20,false,scale_x,scale_y,1);
}
gpu_set_blendmode(bm_normal)
if(light_image > 0)draw_laser(laser_sprite,light_image,x+lengthdir_x(20*scale_x,image_angle),y+lengthdir_y(20*scale_y,image_angle),0,image_angle,len-20,true,image_xscale*scale_x,image_yscale*scale_y,light_alpha);
if(size = 0)gpu_set_blendmode(bm_add);
draw_laser(start_sprite,0,x,y,12*(size=1),image_angle,len,0,image_xscale*scale_x,image_yscale*scale_y,image_alpha,true)
gpu_set_blendmode(bm_normal)
if(instance_exists(find_enemy)){
	enemy = find_enemy;
	CollideSingleEnemy(enemy);
	enemy.frozen_amount += frozen_damage;
	ex = x + lengthdir_x(len,image_angle);
	ey = y + lengthdir_y(len,image_angle);
	if(size = 0){
		draw_sprite_ext(spr_bullet_effect_mega,0,ex,ey,image_xscale*scale_x*choose(1,-1)*0.7,image_yscale*scale_y*image_xscale*0.5,choose(0,180),-1,image_alpha);
	}
	else{
		draw_sprite_ext(spr_bullet_effect_glacier_1,0,ex,ey-(time mod 8)*12,image_xscale*scale_x*((time mod 8)-8)/2,image_xscale*scale_y*2,0,-1,(8-time mod 8)/8);
		effect_xscale = (0.7 + 0.035 * sin(time*4));
		effect_yscale = (0.7 - 0.12 * sin(time*4));
		draw_sprite_ext(spr_bullet_effect_glacier_0,0,ex,ey,image_xscale*scale_x*effect_xscale,effect_yscale*scale_y*image_xscale,0,-1,1);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_bullet_effect_glacier_light,0,ex,ey,max(0,6-time)*1.3,max(0,6-time)*1.3,0,-1,max((6-time)/6,0));
		gpu_set_blendmode(bm_normal);
	}
}