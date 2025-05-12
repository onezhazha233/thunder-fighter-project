live;
draw_sprite(spr_ui_hpbar_player,0,0,0)
draw_sprite_part_ext(spr_ui_hpbar_player_yellow,0,0,0,sprite_get_width(spr_ui_hpbar_player_yellow)*(global.hp/global.hpmax),sprite_get_height(spr_ui_hpbar_player_yellow),114,30,1,1,-1,1)

if(boss_hpbar_enabled = true){
	draw_sprite_ext(spr_ui_hpbar_boss_name,0,360-273-3,104,1,1,0,-1,1);
	draw_set_font(Lang_GetFont("zpix"));
	draw_set_valign(fa_bottom);
	draw_text_transformed(360-273+7,104,"LV."+string(boss_hpbar_lv)+"  "+boss_hpbar_name,0.8,0.8,0);
	draw_set_valign(fa_top);
	draw_sprite_ext(spr_ui_hpbar_boss_bg,0,360,110,1,1,0,-1,1);
	for(i=0;i<boss_hpbar_phase+1;i+=1){
		if(i = boss_hpbar_phase){
			length = (boss_hpbar_hp/boss_hpbar_hp_max)*537;
		}
		else{
			length = 537;
		}
		draw_sprite_ext(spr_ui_hpbar_boss_bar,i,360-273+5,110,length,1,0,-1,1);
	}
}