live;
draw_sprite(spr_ui_hpbar_player,0,0,0)
draw_sprite_part_ext(spr_ui_hpbar_player_yellow,0,0,0,sprite_get_width(spr_ui_hpbar_player_yellow)*(global.hp/global.hpmax),sprite_get_height(spr_ui_hpbar_player_yellow),114,30,1,1,-1,1)