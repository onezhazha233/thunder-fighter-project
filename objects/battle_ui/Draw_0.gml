live;
draw_sprite(spr_ui_hpbar_player,0,camera._shake_pos_x+0,camera._shake_pos_y+0)
sco = floor(global.score)
for(i=1;i<string_length(sco)+1;i+=1){
	draw_sprite_ext(spr_ui_score_number,real(string_char_at(sco,i)),camera._shake_pos_x+200+i*16,camera._shake_pos_y+4,0.8,0.8,0,-1,1);
}
if(global.hp <= global.hp_max*0.25){
	hp_red_time += 1;
	draw_sprite_part_ext(spr_ui_hpbar_player_red,0,0,0,sprite_get_width(spr_ui_hpbar_player_red),sprite_get_height(spr_ui_hpbar_player_red),camera._shake_pos_x+114,camera._shake_pos_y+30,1,1,-1,0.25-cos(hp_red_time/10)*0.25);
	draw_sprite_part_ext(spr_ui_hpbar_player_red,0,0,0,sprite_get_width(spr_ui_hpbar_player_red)*(global.hp/global.hp_max),sprite_get_height(spr_ui_hpbar_player_red),camera._shake_pos_x+114,camera._shake_pos_y+30,1,1,-1,1);
}
else{
	hp_red_time = 0;
	draw_sprite_part_ext(spr_ui_hpbar_player_yellow,0,0,0,sprite_get_width(spr_ui_hpbar_player_yellow)*(global.hp/global.hp_max),sprite_get_height(spr_ui_hpbar_player_yellow),camera._shake_pos_x+114,camera._shake_pos_y+30,1,1,-1,1);
}

if(boss_hpbar_enabled = true){
	draw_sprite_ext(spr_ui_hpbar_boss_name,0,camera._shake_pos_x+360-273-3,camera._shake_pos_y+104,1,1,0,-1,1);
	draw_set_font(Lang_GetFont("zpix"));
	draw_set_valign(fa_bottom);
	draw_text_transformed(camera._shake_pos_x+360-273+7,camera._shake_pos_y+104,"LV."+string(boss_hpbar_lv)+"  "+boss_hpbar_name,0.8,0.8,0);
	draw_set_valign(fa_top);
	draw_sprite_ext(spr_ui_hpbar_boss_bg,0,camera._shake_pos_x+360,camera._shake_pos_y+110,1,1,0,-1,1);
	for(i=0;i<boss_hpbar_phase+1;i+=1){
		if(i = boss_hpbar_phase){
			length = (boss_hpbar_hp/boss_hpbar_hp_max)*537;
		}
		else{
			length = 537;
		}
		length = clamp(length,0,537);
		draw_sprite_ext(spr_ui_hpbar_boss_bar,i,camera._shake_pos_x+360-273+5,camera._shake_pos_y+110,length,1,0,-1,1);
	}
}