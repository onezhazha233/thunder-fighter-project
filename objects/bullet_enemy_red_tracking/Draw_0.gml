live;
event_inherited();

spd += (point_distance(xp,yp,x,y)/20-spd)/3
spd = min(1.5,spd)
dd0 = point_direction(xp,yp,x,y);
if(dd != dd0&&point_distance(xp,yp,x,y) != 0)dd = dd0;

gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_bullet_enemy_red_tracking_3,0,x,y,image_xscale*scale_x*1.5,image_yscale*scale_y*spd,dd+90,-1,1)
draw_sprite_ext(spr_bullet_enemy_red_tracking_0,0,x,y,image_xscale*scale_x,image_yscale*scale_y,0,-1,1)
gpu_set_blendmode(bm_normal)
draw_sprite_ext(spr_bullet_enemy_red_tracking_1,0,x,y,image_xscale*scale_x*(0.8+0.1*(abs(time-5)/5)),image_yscale*scale_y*(0.8+0.2*(abs(time-5)/5)),0,-1,1)
draw_sprite_ext(spr_bullet_enemy_red_tracking_2,0,x,y,image_xscale*scale_x,image_yscale*scale_y,0,-1,1)
draw_sprite_ext(spr_bullet_enemy_red_tracking_1,0,x,y,image_xscale*scale_x*(0.5+time/10*1.1),image_yscale*scale_y*(0.5+time/10*1.1),0,-1,(time < 6 ? 1 : 1-(time-6)/4))

time += 1
if(time > 10)time = 0;

xp = x
yp = y