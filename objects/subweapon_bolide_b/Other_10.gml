live;
if(weapon_level < 2){
	pn = 2;
	par = 10;
}
if(weapon_level = 2){
	pn = 3;
	par = 15;
}
if(weapon_level = 3){
	pn = 4;
	par = 20;
}

blt = MakePlayerBullet(x-90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_b
blt.piece_sprite = spr_bolide_b_piece_0
blt.piece_tail_sprite = spr_bolide_b_piece_1
blt = MakePlayerBullet(x+90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_b
blt.piece_sprite = spr_bolide_b_piece_0
blt.piece_tail_sprite = spr_bolide_b_piece_1
blt.dir = 1