live;
event_inherited();

if(clduration > 0&&enabled == true){
	cltime += 1;
	cc = 0;
	for(i=0;i<array_length(clinfo);i+=1){
		if(cltime == clinfo[i][0] && cc == 0){
			if(array_length(clinfo[i]) == 4){
				MakeCleave(clinfo[i][1],clinfo[i][2],clinfo[i][3]);
			}
			else if(array_length(clinfo[i]) == 5){
				MakeCleave(clinfo[i][1],clinfo[i][2],clinfo[i][3],clinfo[i][4]);
			}
			else{
				MakeCleave(clinfo[i][1],clinfo[i][2]);
			}
			cc = 1;
		}
	}
	if(cltime == 40){
		MakePlayerBullet(x,y,bullet_player_plane_azurewing_vertical).damage = damage*2;
	}
	if(cltime > clduration){
		cltime = 0;
		clduration = -1;
	}
}
else{
	cltime = 0;
}