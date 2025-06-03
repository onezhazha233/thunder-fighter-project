live;
event_inherited();

draw_sprite_ext(spr_pixel2x,0,x,y,150,60,0,image_blend,image_alpha)

var now = time;
while(!ds_list_empty(damage_history) && (now - damage_history[|0][0] > 60)) {
    ds_list_delete(damage_history, 0);
}

// 计算 DPS：总伤害 / 时间跨度（单位为秒）
if (ds_list_size(damage_history) > 0) {
    var total_damage = 0;
    for (var i = 0; i < ds_list_size(damage_history); i++) {
        total_damage += damage_history[|i][1];
    }

    var time_span = 60//(now - damage_history[|0][0]) / 80; // 单位：秒
    //if (time_span <= 0) time_span = 1/80;

    current_dps = total_damage / time_span;
	
} else {
    current_dps = 0;
}

while(!ds_list_empty(dpss)&&ds_list_size(dpss) > 400){
	ds_list_delete(dpss,0);
}
ds_list_add(dpss,current_dps);

var tdps = 0;
for (var i = 0; i < ds_list_size(dpss); i++) {
    tdps += dpss[|i];
}

draw_set_color(c_black)
draw_set_font(Lang_GetFont("zpix"))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(x,y-20,"dpf:"+string_format(current_dps,0,4),1,1,0)
draw_text_transformed(x,y+20,"average dpf:"+string_format(tdps/ds_list_size(dpss),0,4),1,1,0)
draw_set_halign(fa_left)
draw_set_valign(fa_top)