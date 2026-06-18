live;
angle = -90
for(i=0;i<2;i+=1){
	blt = MakePlayerBullet(x,y,bullet_player_helix_piercer,seq_helix_piercer_ab);
	with(blt){
		layer_sequence_xscale(bullet_sequence,0);
		layer_sequence_yscale(bullet_sequence,0);
	}
	blt.part_add = 1;
	blt.image_angle = angle - 90;
	blt.damage = damage;
	angle += 180;
}