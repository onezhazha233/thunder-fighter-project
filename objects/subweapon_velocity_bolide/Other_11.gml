live;
dd = (bb = 0 ? 66 : 133)
pn = 4
par = 20

blt = MakePlayerBullet(x-dd,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_c
blt.piece_sprite = spr_bolide_c_piece_0
blt.piece_tail_sprite = spr_bolide_c_piece_1
blt = MakePlayerBullet(x+dd,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt.sprite_index = spr_bolide_c
blt.piece_sprite = spr_bolide_c_piece_0
blt.piece_tail_sprite = spr_bolide_c_piece_1
blt.dir = 1

bb = !bb