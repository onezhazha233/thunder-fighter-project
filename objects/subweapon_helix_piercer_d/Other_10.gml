live;
angle = -90
for(i=0;i<2+(weapon_level==3);i+=1){
	blt = MakePlayerBullet(x,y,bullet_player_helix_piercer,seq_helix_piercer_d);
	with(blt){
		layer_sequence_xscale(bullet_sequence,0);
		layer_sequence_yscale(bullet_sequence,0);
	}
	blt.cc = c_yellow;
	blt.part_add = 2;
	blt.big = 1;
	blt.image_angle = angle - 90;
	blt.damage = damage;
	Anim_Create(blt,"damage",0,0,0,damage,60);
	blt.damage_interval = 10;
	Anim_Create(blt,"damage_interval",0,0,10,-9,90);
	angle += 180-(weapon_level==3)*60;
}