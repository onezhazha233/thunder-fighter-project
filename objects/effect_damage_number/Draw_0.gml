live;
//draw_circle(x,y,2,0)
//draw_sprite(spr_effect_damage_number_plane,0,x,y)

draw_set_alpha(alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white); // 你可以改颜色
draw_set_font(Lang_GetFont("zpix"));

// 1. 根据类型选择图标精灵
var spr_icon;
switch (type) {
    case 0: spr_icon = spr_effect_damage_number_plane; break;
    case 1: spr_icon = spr_effect_damage_number_wingman; break;
    case 2: spr_icon = spr_effect_damage_number_subweapon; break;
}

// 2. 取图标尺寸
var iw = sprite_get_width(spr_icon)/2;
var ih = sprite_get_height(spr_icon);

// 3. 数字尺寸
var str = string(damage);
var tw = string_width(str);

// 4. 整体总宽度（数学居中核心）
var total_w = iw * scale +  tw * scale;

// 5. 整体居中的起始 X（最左侧位置）
var base_x = x - total_w / 2;
var base_y = y;

// 6. 绘制图标（左侧）
draw_sprite_ext(spr_icon, 0,base_x, base_y,scale, scale,0, -1, alpha);

// 7. 绘制数字（右侧）
draw_text_ext_transformed_color(base_x + iw * scale+1,base_y-15*scale,str,0, 999,scale, scale,0,0,0,0,0,alpha);
draw_text_ext_transformed_color(base_x + iw * scale-1,base_y-15*scale,str,0, 999,scale, scale,0,0,0,0,0,alpha);
draw_text_ext_transformed_color(base_x + iw * scale,base_y-15*scale+1,str,0, 999,scale, scale,0,0,0,0,0,alpha);
draw_text_ext_transformed_color(base_x + iw * scale,base_y-15*scale-1,str,0, 999,scale, scale,0,0,0,0,0,alpha);
draw_text_ext_transformed_color(base_x + iw * scale,base_y-15*scale,str,0, 999,scale, scale,0,-1,-1,-1,-1,alpha);

draw_set_alpha(1);