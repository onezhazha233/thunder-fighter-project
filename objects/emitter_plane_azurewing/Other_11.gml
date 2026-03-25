live;
xx = x
yy = y
//clduration = 40;
//clinfo = [[1,120,0.6,0,1],[8,40,0.65,1],[16,-40,0.7,0],[24,-120,0.75,1]];
switch(rt mod 4){
	case 0:
		MakeCleave(120,0.6,rr);
		break;
	case 1:
		MakeCleave(40,0.65,!rr);
		break;
	case 2:
		MakeCleave(-40,0.7,rr);
		break;
	case 3:
		MakeCleave(-120,0.75,!rr);
		rr = !rr;
		break;
}

rt += 1

switch(rt mod 12){
	case 0:
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical);
		break;
	case 2:
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical).image_angle = 30;
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical).image_angle = -30;
		break;
	case 4:
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical).image_angle = 60;
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical).image_angle = -60;
		break;
}