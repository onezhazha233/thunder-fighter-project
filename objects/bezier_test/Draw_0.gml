// 画个简单的圆代替精灵
draw_sprite_ext(spr_warper_abcd,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if(Anim_IsExists(id,"__PATH__")&&!Anim_IsPaused(id,"__PATH__")){
	image_angle = point_direction(x,y,xp,yp)+90;
	xp = x;
	yp = y;
}

// 辅助文字
draw_set_halign(fa_center);
draw_text(360, 50, "Left Click: S-Path (5 Points) + Scale\nRight Click: Random Path + Callback");

// 如果你有一个正在运行或者准备运行的路径对象
if (variable_instance_exists(id, "random_path")) {
    Bezier_Path_Draw_Debug(random_path, 40, c_aqua, true);
}