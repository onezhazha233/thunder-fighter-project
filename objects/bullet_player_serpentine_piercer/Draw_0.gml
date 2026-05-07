live;
image_xscale = scale_x
image_yscale = scale_y
image_angle = point_direction(xprevious,yprevious,x,y)-90

history_x[current_frame] = x;
history_y[current_frame] = y;
history_image_xscale[current_frame] = image_xscale;
history_image_yscale[current_frame] = image_yscale;
history_image_angle[current_frame] = image_angle;
history_sprite_index[current_frame] = l2_sprite;
current_frame = (current_frame + 1) % 12;

for (var i = 1; i <= 12; i+=(5-rampage)) {
	var frame_index = (current_frame + i) % 12;
	var alpha = 1 * (i / 12);
	draw_sprite_ext(l0_sprite, 0, 
	                history_x[frame_index]-lengthdir_x(37,history_image_angle[frame_index]+90)*history_image_xscale[frame_index], history_y[frame_index]-lengthdir_y(37,history_image_angle[frame_index]+90)*history_image_xscale[frame_index], 
	                history_image_xscale[frame_index], history_image_yscale[frame_index], history_image_angle[frame_index], image_blend, alpha);
	if(rampage = true)draw_sprite_ext(history_sprite_index[frame_index], 0, 
	                history_x[frame_index]-lengthdir_x(37,history_image_angle[frame_index]+90)*history_image_xscale[frame_index], history_y[frame_index]-lengthdir_y(37,history_image_angle[frame_index]+90)*history_image_xscale[frame_index], 
	                history_image_xscale[frame_index], history_image_yscale[frame_index], history_image_angle[frame_index], image_blend, alpha);
}

animtime += 1
draw_sprite_ext(flame_sprite,0,x,y,image_xscale*(0.9+sin(animtime)*0.2),image_yscale*(0.9-sin(animtime)*0.2),image_angle,image_blend,image_alpha)
draw_sprite_ext(l2_sprite,0,x-lengthdir_x(37,image_angle-90)*image_xscale,y-lengthdir_y(37,image_angle-90)*image_yscale,image_xscale*(1.05+sin(animtime*1.5)*0.05),image_yscale*(1.05+sin(animtime*1.5)*0.05),image_angle,image_blend,image_alpha)
if(rampage = true)draw_sprite_ext(l0_sprite,0,x,y,image_xscale*(1.05+cos(animtime*1.5)*0.05),image_yscale*(1.05+sin(animtime*1.5)*0.05),image_angle,image_blend,image_alpha)
if(rampage = true)draw_sprite_ext(spr_serpentine_piercer_cd_light_1,0,x,y,image_xscale*(1.05+cos(animtime*1.5)*0.05),image_yscale*(1.05+sin(animtime*1.5)*0.05),image_angle,image_blend,image_alpha)
draw_sprite_ext(body_sprite,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_serpentine_piercer_cd_light_3,0,x-lengthdir_x(16,image_angle-90)*image_xscale,y-lengthdir_y(16,image_angle-90)*image_yscale,image_xscale*(1.05+cos(animtime)*0.1),image_yscale*(1.2+sin(animtime*2)*0.2),image_angle,image_blend,image_alpha*(0.5+rampage*0.5))
gpu_set_blendmode(bm_normal)

event_inherited();