live;
if(weapon_level < 2){
	pn = 2;
	par = 10;
}
else{
	pn = 3;
	par = 15;
}

blt = MakePlayerBullet(x-90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_anglerange = par
blt.damage = damage
blt = MakePlayerBullet(x+90,y,bullet_player_bolide)
blt.piece_number = pn
blt.piece_number = pn
blt.piece_anglerange = par
blt.dir = 1
blt.damage = damage