live;
rand_angle_offset -= 0.55

var light1_kfs=[{f:18,c:16777215},{f:27,c:4294967295},{f:54,c:16777215}];
var light2_kfs=[{f:0,c:16777215},{f:9,c:4294967295},{f:25,c:4294967295},{f:54,c:16777215}];
var ring_white_kfs=[{f:85,c:16777215},{f:96,c:4294967295},{f:110,c:16777215}];
var ring_blue3_kfs=[{f:0,c:4294967295},{f:42,c:4294967295},{f:60,c:16777215}];
if(time>=18&&time<=54){
    gpu_set_blendmode(bm_add);
    var sc=lerp(0,0.66,clamp((time-18)/9,0,1));
    var ro=lerp(30,-60,(time-18)/36);
    var al=get_alpha_kf(light1_kfs,time);
    draw_sprite_ext(spr_effect_timedom_light,-1,x,y,sc,sc,ro,c_white,al/255);
    gpu_set_blendmode(bm_normal);
}
if(time>=0&&time<=54){
    gpu_set_blendmode(bm_add);
    var sc=lerp(0,0.66,clamp((time-0)/9,0,1));
    var ro=lerp(0,90,(time-0)/54);
    var al=get_alpha_kf(light2_kfs,time);
    draw_sprite_ext(spr_effect_timedom_light,-1,x,y,sc,sc,ro,c_white,al/255);
    gpu_set_blendmode(bm_normal);
}
if(time>=85&&time<=110){
    var al=get_alpha_kf(ring_white_kfs,time);
    draw_sprite_ext(spr_effect_timedom_item_ring,-1,x,y,1,1,180,c_white,al/255);
    draw_sprite_ext(spr_effect_timedom_item_ring,-1,x,y,1,1,0,c_white,al/255);
}
if(time>=85&&time<=110){
    var al=get_alpha_kf(ring_white_kfs,time);
    draw_sprite_ext(spr_effect_timedom_ring,-1,x,y,1,1,0,c_white,al/255);
}
if(time>=0&&time<=16){
    var sc=lerp(0.7,0,(time-0)/16);
    draw_sprite_ext(spr_effect_timedom_ring,-1,x,y,sc,sc,0,c_white,1);
}
for(var i=0;i<array_length(ring_parts);i++){
    var p=ring_parts[i];
    if(time>=p.s&&time<=96){
        var sc=lerp(0,0.57,clamp((time-p.s)/16,0,1));
        var al=255;
        if(time>=86){
            al=lerp(255,0,clamp((time-86)/10,0,1));
        }
        var ro=p.r+rand_angle_offset;
        draw_sprite_ext(spr_effect_timedom_ring_part,-1,x,y,sc,sc,ro,c_white,al/255);
    }
}
if(time>=20&&time<=36){
    var sc=lerp(0,0.57,(time-20)/16);
    draw_sprite_ext(spr_effect_timedom_ring_blue,-1,x,y,sc,sc,0,c_white,1);
}
if(time>=9&&time<=20){
    var sc=lerp(0,0.57,(time-9)/11);
    draw_sprite_ext(spr_effect_timedom_ring_blue,-1,x,y,sc,sc,0,c_white,1);
}
if(time>=0&&time<=60){
    var sc=lerp(0,0.57,clamp((time-0)/7,0,1));
    var al=get_alpha_kf(ring_blue3_kfs,time);
    draw_sprite_ext(spr_effect_timedom_ring_blue,-1,x,y,sc,sc,0,c_white,al/255);
}
gpu_set_blendmode(bm_normal);