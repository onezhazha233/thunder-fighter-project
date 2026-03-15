live;
image_xscale = scale_x;
image_yscale = scale_y;

anim_time += 1;
if(anim_time >= anim_len){
	anim_time = 0;
}

// update flame
flame_timer -= 1;
if(flame_timer <= 0){
	var f = {ox:lengthdir_x(12*scale_x,image_angle-90),oy:lengthdir_y(12*scale_y,image_angle-90),scale:flame_scale,alpha:flame_alpha};
	array_push(flame_list,f);
	flame_timer = flame_interval;
}

for(var i = array_length(flame_list)-1; i >= 0; i--){
	var f = flame_list[i];
	f.ox += lengthdir_x(flame_speed*scale_x,image_angle-90);
	f.oy += lengthdir_y(flame_speed*scale_y,image_angle-90);
	f.scale -= 0.15;
	f.alpha -= 0.04;
	if(f.scale <= 0 || f.alpha <= 0){
		array_delete(flame_list,i,1);
		continue;
	}
	flame_list[i] = f;
}

var t01 = anim_time/(anim_len-1);
var light_a_alpha = (t01 <= 0.5 ? t01*2 : (1-t01)*2);
var light_b_alpha = 1-t01;
var light_a_off = 6;
var light_b_off = 6;
if(anim_time >= 6 && anim_time <= 16){
	light_b_off = lerp(6,-10,(anim_time-6)/10);
} else if(anim_time > 16){
	light_b_off = -10;
}

var light_a_x = x + lengthdir_x(light_a_off,image_angle-90);
var light_a_y = y + lengthdir_y(light_a_off,image_angle-90);
var light_b_x = x + lengthdir_x(light_b_off,image_angle-90);
var light_b_y = y + lengthdir_y(light_b_off,image_angle-90);


for(var i = 0; i < array_length(flame_list); i++){
	var f = flame_list[i];
	draw_sprite_ext(spr_bullet_player_overwatcher_drone_flame,0,x+f.ox,y+f.oy,f.scale*scale_x,f.scale*scale_y,image_angle,c_white,f.alpha);
}
draw_self();

gpu_set_blendmode(bm_add);
if(light_a_alpha > 0){
	draw_sprite_ext(spr_bullet_player_overwatcher_d_drone_0_light,0,light_a_x,light_a_y,scale_x*1.5,scale_y*1.5,image_angle,c_white,image_alpha*light_a_alpha);
}
if(light_b_alpha > 0){
	draw_sprite_ext(spr_bullet_player_overwatcher_d_drone_0_light,0,light_b_x,light_b_y,scale_x,scale_y,image_angle,c_white,image_alpha*light_b_alpha);
}
gpu_set_blendmode(bm_normal);

