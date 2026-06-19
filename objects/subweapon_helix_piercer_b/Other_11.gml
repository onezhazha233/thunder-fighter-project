live;
angle = -60
for(i=0;i<3;i+=1){
	blt = MakePlayerBullet(x,y,bullet_player_helix_piercer,seq_helix_piercer_ab_rampage);
	with(blt){
		layer_sequence_xscale(bullet_sequence,0);
		layer_sequence_yscale(bullet_sequence,0);
		rotspd = 13;
		Anim_Create(id,"rotspd",0,0,13,-6,30);
	}
	blt.part_add = 1;
	blt.rampage = true;
	blt.image_angle = angle - 90;
	blt.damage = 0;
	Anim_Create(blt,"damage",0,0,0,damage,60);
	blt.damage_interval = 10;
	Anim_Create(blt,"damage_interval",0,0,10,-9,90);
	angle += 120;
}
alarm[2] = 9