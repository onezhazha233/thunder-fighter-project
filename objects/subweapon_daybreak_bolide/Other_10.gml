live;
if(weapon_level = 0){
	pn = 2;
	par = 10;
}
if(weapon_level = 1){
	pn = 3;
	par = 15;
}
if(weapon_level = 2){
	pn = 4;
	par = 20;
}
if(weapon_level = 3){
	pn = 5;
	par = 25;
}

blt = MakePlayerBullet(x-90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_d
blt.piece_sprite = spr_bolide_d_piece_0
blt.piece_tail_sprite = spr_bolide_d_piece_1
blt = MakePlayerBullet(x+90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_d
blt.piece_sprite = spr_bolide_d_piece_0
blt.piece_tail_sprite = spr_bolide_d_piece_1
blt.dir = 1