live;
dd = (bb = 0 ? 66 : 133)
pn = 4
par = 20

blt = MakePlayerBullet(x-dd,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt = MakePlayerBullet(x+dd,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.dir = 1
blt.damage = damage

bb = !bb